package com.cubesofttech.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.JobDAO;
import com.cubesofttech.dao.PageUriDAO;
import com.cubesofttech.model.Job;
import com.cubesofttech.model.PageUri;
import com.cubesofttech.model.Testimonial;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.ArticleHtmlSanitizer;
import com.cubesofttech.util.JobDescriptionSectionRebuilder;
import com.cubesofttech.util.RewriteFilter;
import com.cubesofttech.mail.EmailService;
import com.cubesofttech.validation.ContactFormValidator;
import com.cubesofttech.validation.ValidationResult;
import com.opensymphony.xwork2.ActionSupport;

public class CareersAction extends ActionSupport {
	public static final String REDESIGN = "redesign";
	public static final String INVALID_JOB = "invalidJob";

	// Matches struts.multipart.maxSize in actionfront.xml.
	private static final long MAX_RESUME_FILE_SIZE = 30_000_000L;
	private static final String[] ALLOWED_RESUME_EXTENSIONS = { "pdf", "doc", "docx" };

	// Caps how many intern testimonial cards the careers page shows - keep this
	// when buildMockTestimonials() is replaced by a real DAO query (e.g. LIMIT 6).
	private static final int MAX_TESTIMONIALS = 6;

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
			request.setAttribute("jobList", jobList);
			request.setAttribute("testimonials", buildMockTestimonials());
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

	private List<Testimonial> buildMockTestimonials() {
		List<Testimonial> testimonials = new ArrayList<Testimonial>();
		testimonials.add(new Testimonial(
				"Ram",
				"Full Stack Developer",
				"การฝึกงานที่ Cube SoftTech ถึงแม้ยังฝึกไม่ถึงเดือน แต่ผมได้เรียนรู้ Tool และ Framework ใหม่ๆ ได้ลองทำ Tutorial และ Exercise เพื่อต่อยอดในการทำงานจริง\r\n"
				+ "\r\n"
				+ "พี่เลี้ยง พี่ในทีม เป็นกันเองและใจดีมากครับ ช่วยให้คำแนะนำที่ดีเวลาติดปัญหา สามารถถามได้ตลอด\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ ผมได้ทักษะการสื่อสารเป็นทีม การทำงานเป็นทีม เพื่อไปใช้ในการทำงานจริงในอนาคตครับ",
				"/pages-front/img/redesign/careers/careers-intern-avatar.png"));
		testimonials.add(new Testimonial(
				"Boom",
				"Full Stack Developer",
				"การฝึกงานที่ Cube SoftTech เป็นโอกาสที่ดีที่ได้ทำงานพัฒนาระบบที่ได้ใช้งานจริงภายในองค์กร ทำให้ได้เรียนรู้การเจอปัญหาจริงในการพัฒนาระบบ ขั้นตอนการทำงาน ที่ไม่เหมือนแค่ในห้องเรียน\r\n"
				+ "\r\n"
				+ "พี่เลี้ยงในทีมทุกคนใส่ใจ พร้อมช่วยเหลือ ให้คำแนะนำการใช้อุปกรณ์สำหรับพัฒนาระบบ สอนใช้เทคโนโลยีที่ใช้ในงาน เพื่อให้เราเรียนรู้ได้เต็มที่จากการฝึกงาน\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ การได้ลองจับงานจริง การได้เข้าร่วมประชุม หาไอเดียในการพัฒนาระบบ ซึ่งเป็นโอกาสดี ทำให้เข้าใจบรรยากาศการทำงานจริง และทำให้พร้อมมากขึ้นสำหรับการทำงานในสายอาชีพนักพัฒนา",
				"/pages-front/img/redesign/careers/careers-intern-avatar.png"));
		testimonials.add(new Testimonial(
				"Jinny",
				"Full Stack Developer",
				"การฝึกงานที่ Cube SoftTech ตอนแรกยังไม่คุ้นเคยกับ Framework มีโอกาสได้เรียนรู้ผ่าน Tutorial ลองทำ Exercise ไปเรื่อยๆ ทั้งฝั่งของหน้าบ้านและหลังบ้าน ทำให้เข้าใจภาพรวมของการพัฒนาระบบที่มีผู้ใช้งานจริงๆ\r\n"
				+ "\r\n"
				+ "พี่เลี้ยงกับพี่ๆ ในทีมใจดีและเป็นกันเองมากค่ะ เวลาติดปัญหาก็สามารถถามได้ตลอด พี่ๆ พร้อมช่วยอธิบายแนะแนวทางให้ แถมยังเปิดโอกาสให้ได้ลองทำในสิ่งที่สนใจด้วยค่ะ\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ ทักษะการค้นคว้าแก้ปัญหาด้วยตัวเอง และได้เห็นกระบวนการทำงานจริงในบริษัท ซึ่งเป็นประสบการณ์ที่มีค่าและช่วยให้พร้อมสำหรับการทำงานในอนาคตมากๆ ค่ะ",
				"/pages-front/img/redesign/careers/careers-intern-avatar.png"));
		testimonials.add(new Testimonial(
				"Oshi",
				"Frontend Developer",
				"การฝึกงานที่ Cube SoftTech เป็นประสบการณ์ที่ดี ท้าทายมากครับ ได้ลุยงานจริงทั้งฝั่ง Frontend และ Backend ทำให้เห็นภาพรวมของการทำงานแบบครบวงจรเลย\r\n"
				+ "\r\n"
				+ "พี่เลี้ยงก็น่ารักและเก่งมากๆ คอยสอนเทคนิคต่างๆ ให้คำแนะนำแบบเป็นกันเองสุดๆ ทำให้ผมกล้าถามเวลาที่ติดปัญหาเรื่องโค้ด กล้าลองผิดลองถูก\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ ได้อัปสกิลการเขียนโปรแกรม ได้เรียนรู้วิธีการทำงานจริงร่วมกับทีมและระบบการทำงานของบริษัทด้วยครับ",
				"/pages-front/img/redesign/careers/careers-intern-avatar.png"));
		testimonials.add(new Testimonial(
				"Best",
				"Full Stack Developer",
				"การฝึกงานที่ Cube SoftTech เป็นประสบการณ์ที่ดีมากสำหรับผม เพราะได้มีโอกาสทำงานกับโปรเจกต์จริงและเรียนรู้เทคโนโลยีที่ใช้ในการพัฒนาซอฟต์แวร์จริงๆ\r\n"
				+ "\r\n"
				+ "พี่ๆ ในทีม พี่เลี้ยงให้คำแนะนำดีมาก เวลามีปัญหาหรือข้อสงสัยสามารถถามได้ตลอด\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ แม้ว่าผมจะเพิ่งเริ่มฝึกงานได้ไม่นาน แต่ผมก็ได้รับความรู้ มุมมองเกี่ยวกับการทำงานจริงมากขึ้น ทั้งเทคโนโลยีที่ใช้ในการพัฒนาระบบ แนวทางการทำงานในองค์กร เป็นประสบการณ์ที่ดีและเป็นประโยชน์ต่อการพัฒนาตัวเองต่อไปในอนาคต",
				"/pages-front/img/redesign/careers/careers-intern-avatar.png"));
		testimonials.add(new Testimonial(
				"Team",
				"Full Stack Developer",
				"การฝึกงานที่ Cube SoftTech ผมได้เรียนรู้การใช้งาน Tool และ Framework ใหม่ๆ ได้ลองเขียนระบบจริง ทำให้ได้เรียนรู้โครงสร้างระบบต่างๆ\r\n"
				+ "\r\n"
				+ "พี่เลี้ยงทุกคนเป็นกันเอง คอยให้คำแนะนำและแบ่งปันเทคนิคต่างๆ ตลอด ทำให้ผมสามารถพัฒนาทักษะของตัวเองได้อย่างต่อเนื่อง\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ ได้เรียนรู้การวางแผนงาน การแก้ไขปัญหาที่เกิดขึ้นระหว่างการพัฒนาระบบจริง ช่วยสร้างความมั่นใจในการก้าวเข้าสู่การทำงานในอนาคตครับ",
				"/pages-front/img/redesign/careers/careers-intern-avatar.png"));

		if (testimonials.size() > MAX_TESTIMONIALS) {
			return testimonials.subList(0, MAX_TESTIMONIALS);
		}
		return testimonials;
	}

	private boolean isRedesignPreviewEnabled() {
		return constant.isRedesignEnabled();
	}

	public String jobDetail() {
		try {
			String job_id = request.getParameter("id");
			loadJobContext(job_id);
			request.setAttribute("constant", constant);

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
		request.setAttribute("jobDescriptionHtml", buildJobDescriptionHtml(job.getDescription()));
	}

	// Normalizes postings pasted as flat <div>/<p> runs into real <ul>/<li>
	// sections before sanitizing, so .jobdetail-card's CSS always sees real tags.
	private String buildJobDescriptionHtml(String rawHtml) {
		if (rawHtml == null || rawHtml.trim().isEmpty()) {
			return "";
		}
		Document doc = Jsoup.parseBodyFragment(rawHtml);
		JobDescriptionSectionRebuilder.rebuild(doc);
		return ArticleHtmlSanitizer.clean(doc.body().html());
	}

	// strict is only true on the redesign path - legacy never required a resume
	// or restricted its type (size is still checked either way).
	private String validateResumeFile(File file, String fileName, boolean strict) {
		if (file == null) {
			return strict ? "Please attach your resume" : null;
		}
		if (file.length() > MAX_RESUME_FILE_SIZE) {
			return "File is too large - please upload a file under 30MB";
		}
		if (strict && !hasAllowedExtension(fileName)) {
			return "Please upload a PDF, DOC, or DOCX file";
		}
		return null;
	}

	private boolean hasAllowedExtension(String fileName) {
		if (fileName == null) {
			return false;
		}
		int dotIndex = fileName.lastIndexOf('.');
		if (dotIndex < 0) {
			return false;
		}
		String extension = fileName.substring(dotIndex + 1).toLowerCase();
		for (String allowed : ALLOWED_RESUME_EXTENSIONS) {
			if (allowed.equals(extension)) {
				return true;
			}
		}
		return false;
	}

	public String sendEmailJob() {
		boolean redesign = isRedesignPreviewEnabled();
		try {
			loadJobContext(jobId);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("response", "0");
			if (redesign) {
				return INVALID_JOB;
			}
			return ERROR;
		}

		try {
			request.setAttribute("constant", constant);

			ValidationResult nameResult = ContactFormValidator.validateName(contactName);
			ValidationResult emailResult = ContactFormValidator.validateEmail(contactEmail);
			// Telephone is the one optional field - only format-checked if filled in.
			boolean telProvided = contactTel != null && !contactTel.trim().isEmpty();
			ValidationResult telResult = telProvided ? ContactFormValidator.validatePhone(contactTel)
					: ValidationResult.valid(contactTel);
			String fileError = validateResumeFile(contactFile, contactFileName, redesign);
			// Set by BotProtectionInterceptor (actionfront.xml), which also covers
			// the honeypot field and per-IP rate limit alongside the captcha check.
			boolean captchaValid = !redesign || Boolean.TRUE.equals(request.getAttribute("botCheckPassed"));
			boolean allValid = nameResult.isValid() && emailResult.isValid() && telResult.isValid()
					&& fileError == null && captchaValid;

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
				if (!captchaValid) {
					request.setAttribute("captchaError", "Please complete the verification above and try again.");
				}
				return redesign ? REDESIGN : SUCCESS;
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
	    	return redesign ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("response", "0");
			if (redesign) {
				request.setAttribute("contactName", contactName);
				request.setAttribute("contactEmail", contactEmail);
				request.setAttribute("contactTel", contactTel);
				request.setAttribute("contactMessage", contactMessage);
				request.setAttribute("formError", "Something went wrong - please try again in a moment.");
				return REDESIGN;
			}
			return ERROR;
		}
	}
}
