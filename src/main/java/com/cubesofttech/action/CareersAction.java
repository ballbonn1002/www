package com.cubesofttech.action;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.JobDAO;
import com.cubesofttech.dao.PageUriDAO;
import com.cubesofttech.model.Job;
import com.cubesofttech.model.PageUri;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.FileUtil;
import com.cubesofttech.util.RewriteFilter;
import com.cubesofttech.mail.EmailService;
import com.opensymphony.xwork2.ActionSupport;

public class CareersAction extends ActionSupport {
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
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String jobDetail() {
		try {
			String job_id = request.getParameter("id");
			log.debug(job_id);
			Job job = jobDAO.findById(Integer.parseInt(job_id));
			log.debug(job.getPosition());
			request.setAttribute("job", job);
			request.setAttribute("jobId", job_id);
			
			String requestURI = (String) request.getAttribute("rewrittenRequestURI");
			if (requestURI == null) {
	            requestURI = request.getRequestURI(); // Fallback if not set
	        }
			log.debug(requestURI);
			request.setAttribute("requestURI", requestURI);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String sendEmailJob() {
		try {
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
	    	
	    	emailService.sendEmailJob(contactName, contactEmail, contactTel, contactPosition, contactMessage, contactFile, contactFileName);
	    	request.setAttribute("response", "1");
	    	return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("response", "0");
			return ERROR;
		}
	}
}
