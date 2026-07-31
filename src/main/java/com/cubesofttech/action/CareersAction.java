package com.cubesofttech.action;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.JobDAO;
import com.cubesofttech.dao.PageUriDAO;
import com.cubesofttech.model.Job;
import com.cubesofttech.model.JobRequirements;
import com.cubesofttech.model.PageUri;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.FileUtil;
import com.cubesofttech.util.RewriteFilter;
import com.cubesofttech.mail.EmailService;
import com.cubesofttech.validation.ContactFormValidator;
import com.cubesofttech.validation.ValidationResult;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class CareersAction extends ActionSupport {
	public static final String REDESIGN = "redesign";

	// Matches struts.multipart.maxSize in actionfront.xml; no file type restriction, matching the legacy form.
	private static final long MAX_RESUME_FILE_SIZE = 30_000_000L;

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private JobDAO jobDAO;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private Constant constant;
	
	@Autowired
	private PageUriDAO pageUriDAO;
	
	private String contactName;
	private String contactEmail;
	private String contactTel;
	private String contactPosition;
	private String contactMessage;
	private File contactFile;
	private String contactFileName;
	private String jobId;

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}


	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

	public String getContactPosition() {
		return contactPosition;
	}

	public void setContactPosition(String contactPosition) {
		this.contactPosition = contactPosition;
	}

	public String getContactMessage() {
		return contactMessage;
	}

	public void setContactMessage(String contactMessage) {
		this.contactMessage = contactMessage;
	}
	
	public File getContactFile() {
		return contactFile;
	}

	public void setContactFile(File contactFile) {
		this.contactFile = contactFile;
	}
	
	public String getContactFileName() {
		return contactFileName;
	}

	public void setContactFileName(String contactFileName) {
		this.contactFileName = contactFileName;
	}

	public String init() {
		try {			
			List<Job> jobList = jobDAO.findAllWithPageUri();
			//log.debug(jobList);
			request.setAttribute("jobList", jobList);
			request.setAttribute("constant", constant);
			
			String requestURI = RewriteFilter.getRequestURI(request);
			log.debug(requestURI);
			request.setAttribute("requestURI", requestURI);

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	// Set via /redesign-preview-on (RedesignPreviewAction), not a URL parameter.
	private boolean isRedesignPreviewEnabled() {
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			return false;
		}
		for (Cookie cookie : cookies) {
			if (RedesignPreviewAction.COOKIE_NAME.equals(cookie.getName()) && "1".equals(cookie.getValue())) {
				return true;
			}
		}
		return false;
	}

	public String jobDetail() {
		try {
			String job_id = request.getParameter("id");
			loadJobContext(job_id);

			String requestURI = (String) request.getAttribute("rewrittenRequestURI");
			if (requestURI == null) {
	            requestURI = request.getRequestURI(); // Fallback if not set
	        }
			log.debug(requestURI);
			request.setAttribute("requestURI", requestURI);

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	// Shared by jobDetail() and sendEmailJob() so both render detail.jsp with the same job context.
	private void loadJobContext(String job_id) throws Exception {
		Job job = jobDAO.findById(Integer.parseInt(job_id));
		log.debug(job.getPosition());
		request.setAttribute("job", job);
		request.setAttribute("jobId", job_id);

		// Not-yet-migrated postings fall back to job.description's raw HTML in the JSP.
		if (job.getRequirementsJson() != null && !job.getRequirementsJson().trim().isEmpty()) {
			JobRequirements requirements = new Gson().fromJson(job.getRequirementsJson(), JobRequirements.class);
			request.setAttribute("requirements", requirements);
		}
	}

	// Resume is optional - a missing file is not an error.
	private String validateResumeFile(File file, String fileName) {
		if (file == null) {
			return null;
		}
		if (file.length() > MAX_RESUME_FILE_SIZE) {
			return "File is too large - please upload a file under 30MB";
		}
		return null;
	}

	public String sendEmailJob() {
		try {
			loadJobContext(jobId);
			request.setAttribute("constant", constant);

			ValidationResult nameResult = ContactFormValidator.validateName(contactName);
			ValidationResult emailResult = ContactFormValidator.validateEmail(contactEmail);
			// Telephone is the one optional field - only format-checked if filled in.
			boolean telProvided = contactTel != null && !contactTel.trim().isEmpty();
			ValidationResult telResult = telProvided ? ContactFormValidator.validatePhone(contactTel)
					: ValidationResult.valid(contactTel);
			String fileError = validateResumeFile(contactFile, contactFileName);
			boolean allValid = nameResult.isValid() && emailResult.isValid() && telResult.isValid()
					&& fileError == null;

			// Repopulate what was typed so a validation failure doesn't clear the form.
			request.setAttribute("contactName", contactName);
			request.setAttribute("contactEmail", contactEmail);
			request.setAttribute("contactTel", contactTel);
			request.setAttribute("contactMessage", contactMessage);

			if (!allValid) {
				request.setAttribute("nameError", nameResult.getErrorMessage());
				request.setAttribute("emailError", emailResult.getErrorMessage());
				request.setAttribute("telError", telResult.getErrorMessage());
				request.setAttribute("fileError", fileError);
				return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
			}

			ServletContext context = request.getServletContext();
			String fileServerPath = context.getRealPath("/");
			log.debug(fileServerPath);
			if (contactFile != null) {
				FileUtil.upload(contactFile, fileServerPath, "upload/email/" + contactFileName);
			}
			log.debug("email service is initiated : " +  emailService);
	    	log.debug("name : " + contactName);
	    	log.debug("email : " + contactEmail);
	    	log.debug("tel : " + contactTel);
	    	log.debug("position : " + contactPosition);
	    	log.debug("message : " + contactMessage);
	    	log.debug("file : " + contactFile);

	    	emailService.sendEmailJob(nameResult.getValue(), emailResult.getValue(), telResult.getValue(),
	    			contactPosition, contactMessage, contactFile, contactFileName);
	    	request.setAttribute("response", "1");
	    	return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("response", "0");
			return ERROR;
		}
	}
}
