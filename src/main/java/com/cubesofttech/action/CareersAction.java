package com.cubesofttech.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.JobApplicationDAO;
import com.cubesofttech.dao.JobDAO;
import com.cubesofttech.model.Job;
import com.cubesofttech.model.JobApplication;
import com.cubesofttech.model.Testimonial;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.ArticleHtmlSanitizer;
import com.cubesofttech.util.FileUtil;
import com.cubesofttech.util.FlashScope;
import com.cubesofttech.util.JobDescriptionSectionRebuilder;
import com.cubesofttech.util.RewriteFilter;
import com.cubesofttech.mail.EmailService;
import com.cubesofttech.validation.ContactFormValidator;
import com.cubesofttech.validation.ValidationResult;
import com.opensymphony.xwork2.ActionSupport;

public class CareersAction extends ActionSupport {
	public static final String REDESIGN = "redesign";
	public static final String INVALID_JOB = "invalidJob";
	public static final String SEND_JOB_FAILED = "sendJobFailed";

	// Matches struts.multipart.maxSize in actionfront.xml.
	private static final long MAX_RESUME_FILE_SIZE = 30_000_000L;
	private static final String[] ALLOWED_RESUME_EXTENSIONS = { "pdf", "doc", "docx" };

	// Also the LIMIT to use once buildMockTestimonials() is a real DAO query.
	private static final int MAX_TESTIMONIALS = 6;

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private JobDAO jobDAO;

	@Autowired
	private JobApplicationDAO jobApplicationDAO;

	@Autowired
	private EmailService emailService;

	@Autowired
	private Constant constant;

	private String contactName;
	private String contactEmail;
	private String contactTel;
	private String contactPosition;
	private String contactMessage;
	private File contactFile;
	private String contactFileName;
	private String jobId;
	// Job detail page's own URL, so sendEmailJob() can redirect back to it.
	private String jobUrl;

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobUrl() {
		return jobUrl;
	}

	public void setJobUrl(String jobUrl) {
		this.jobUrl = jobUrl;
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
			List<Job> jobList = jobDAO.findAllJobsWithPageUri();
			request.setAttribute("jobList", jobList);
			request.setAttribute("testimonials", buildMockTestimonials());
			request.setAttribute("constant", constant);

			String requestURI = RewriteFilter.getRequestURI(request);
			log.debug(requestURI);
			request.setAttribute("requestURI", requestURI);

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	private List<Testimonial> buildMockTestimonials() {
		List<Testimonial> testimonials = new ArrayList<Testimonial>();
		testimonials.add(new Testimonial(
				"Ram",
				"Full Stack Developer",
				"ถึงแม้ยังฝึกไม่ถึงเดือน แต่ผมได้เรียนรู้ Tool และ Framework ใหม่ๆ ได้ลองทำ Tutorial และ Exercise เพื่อต่อยอดในการทำงานจริง\r\n"
				+ "\r\n"
				+ "พี่เลี้ยง พี่ในทีม เป็นกันเองและใจดีมากครับ ช่วยให้คำแนะนำที่ดีเวลาติดปัญหา สามารถถามได้ตลอด\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ ผมได้ทักษะการสื่อสารเป็นทีม การทำงานเป็นทีม เพื่อไปใช้ในการทำงานจริงในอนาคตครับ",
				null));
		testimonials.add(new Testimonial(
				"Boom",
				"Full Stack Developer",
				"เป็นโอกาสที่ดีที่ได้ทำงานพัฒนาระบบที่ได้ใช้งานจริงภายในองค์กร ทำให้ได้เรียนรู้การเจอปัญหาจริงในการพัฒนาระบบ ขั้นตอนการทำงาน ที่ไม่เหมือนแค่ในห้องเรียน\r\n"
				+ "\r\n"
				+ "พี่เลี้ยงในทีมทุกคนใส่ใจ พร้อมช่วยเหลือ ให้คำแนะนำการใช้อุปกรณ์สำหรับพัฒนาระบบ สอนใช้เทคโนโลยีที่ใช้ในงาน เพื่อให้เราเรียนรู้ได้เต็มที่จากการฝึกงาน\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ การได้ลองจับงานจริง การได้เข้าร่วมประชุม หาไอเดียในการพัฒนาระบบ ซึ่งเป็นโอกาสดี ทำให้เข้าใจบรรยากาศการทำงานจริง และทำให้พร้อมมากขึ้นสำหรับการทำงานในสายอาชีพนักพัฒนา",
				null));
		testimonials.add(new Testimonial(
				"Jinny",
				"Full Stack Developer",
				"ตอนแรกยังไม่คุ้นเคยกับ Framework มีโอกาสได้เรียนรู้ผ่าน Tutorial ลองทำ Exercise ไปเรื่อยๆ ทั้งฝั่งของหน้าบ้านและหลังบ้าน ทำให้เข้าใจภาพรวมของการพัฒนาระบบที่มีผู้ใช้งานจริงๆ\r\n"
				+ "\r\n"
				+ "พี่เลี้ยงกับพี่ๆ ในทีมใจดีและเป็นกันเองมากค่ะ เวลาติดปัญหาก็สามารถถามได้ตลอด พี่ๆ พร้อมช่วยอธิบายแนะแนวทางให้ แถมยังเปิดโอกาสให้ได้ลองทำในสิ่งที่สนใจด้วยค่ะ\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ ทักษะการค้นคว้าแก้ปัญหาด้วยตัวเอง และได้เห็นกระบวนการทำงานจริงในบริษัท ซึ่งเป็นประสบการณ์ที่มีค่าและช่วยให้พร้อมสำหรับการทำงานในอนาคตมากๆ ค่ะ",
				null));
		testimonials.add(new Testimonial(
				"Oshi",
				"Frontend Developer",
				"การฝึกงานที่ Cube SoftTech เป็นประสบการณ์ที่ดี ท้าทายมากครับ ได้ลุยงานจริงทั้งฝั่ง Frontend และ Backend ทำให้เห็นภาพรวมของการทำงานแบบครบวงจรเลย\r\n"
				+ "\r\n"
				+ "พี่เลี้ยงก็น่ารักและเก่งมากๆ คอยสอนเทคนิคต่างๆ ให้คำแนะนำแบบเป็นกันเองสุดๆ ทำให้ผมกล้าถามเวลาที่ติดปัญหาเรื่องโค้ด กล้าลองผิดลองถูก\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ ได้อัปสกิลการเขียนโปรแกรม ได้เรียนรู้วิธีการทำงานจริงร่วมกับทีมและระบบการทำงานของบริษัทด้วยครับ",
				null));
		testimonials.add(new Testimonial(
				"Best",
				"Full Stack Developer",
				"เป็นประสบการณ์ที่ดีมากสำหรับผม เพราะได้มีโอกาสทำงานกับโปรเจกต์จริงและเรียนรู้เทคโนโลยีที่ใช้ในการพัฒนาซอฟต์แวร์จริงๆ\r\n"
				+ "\r\n"
				+ "พี่ๆ ในทีม พี่เลี้ยงให้คำแนะนำดีมาก เวลามีปัญหาหรือข้อสงสัยสามารถถามได้ตลอด\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ แม้ว่าผมจะเพิ่งเริ่มฝึกงานได้ไม่นาน แต่ผมก็ได้รับความรู้ มุมมองเกี่ยวกับการทำงานจริงมากขึ้น ทั้งเทคโนโลยีที่ใช้ในการพัฒนาระบบ แนวทางการทำงานในองค์กร เป็นประสบการณ์ที่ดีและเป็นประโยชน์ต่อการพัฒนาตัวเองต่อไปในอนาคต",
				null));
		testimonials.add(new Testimonial(
				"Team",
				"Full Stack Developer",
				"ผมได้เรียนรู้การใช้งาน Tool และ Framework ใหม่ๆ ได้ลองเขียนระบบจริง ทำให้ได้เรียนรู้โครงสร้างระบบต่างๆ\r\n"
				+ "\r\n"
				+ "พี่เลี้ยงทุกคนเป็นกันเอง คอยให้คำแนะนำและแบ่งปันเทคนิคต่างๆ ตลอด ทำให้ผมสามารถพัฒนาทักษะของตัวเองได้อย่างต่อเนื่อง\r\n"
				+ "\r\n"
				+ "สิ่งที่ได้รับจากการฝึกงานที่นี่ คือ ได้เรียนรู้การวางแผนงาน การแก้ไขปัญหาที่เกิดขึ้นระหว่างการพัฒนาระบบจริง ช่วยสร้างความมั่นใจในการก้าวเข้าสู่การทำงานในอนาคตครับ",
				null));

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
			FlashScope.applyToRequest(request);
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
			log.error(e);
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

	// Rebuilds flat <div>/<p> postings into real <ul>/<li> so .jobdetail-card's CSS applies.
	private String buildJobDescriptionHtml(String rawHtml) {
		if (rawHtml == null || rawHtml.trim().isEmpty()) {
			return "";
		}
		Document doc = Jsoup.parseBodyFragment(rawHtml);
		JobDescriptionSectionRebuilder.rebuild(doc);
		return ArticleHtmlSanitizer.clean(doc.body().html(), constant.getImgContext());
	}

	// strict is only true on the redesign path - legacy never required a resume.
	private String validateResumeFile(File file, String fileName, boolean strict) {
		if (file == null) {
			return strict ? "Please attach your resume" : null;
		}
		if (file.length() > MAX_RESUME_FILE_SIZE) {
			return "File is too large - please upload a file under 30MB";
		}
		if (strict) {
			String extension = extractExtension(fileName);
			if (!hasAllowedExtension(extension) || !hasMatchingFileSignature(file, extension)) {
				return "Please upload a PDF, DOC, or DOCX file";
			}
		}
		return null;
	}

	private String extractExtension(String fileName) {
		if (fileName == null) {
			return null;
		}
		int dotIndex = fileName.lastIndexOf('.');
		if (dotIndex < 0) {
			return null;
		}
		return fileName.substring(dotIndex + 1).toLowerCase();
	}

	private boolean hasAllowedExtension(String extension) {
		if (extension == null) {
			return false;
		}
		for (String allowed : ALLOWED_RESUME_EXTENSIONS) {
			if (allowed.equals(extension)) {
				return true;
			}
		}
		return false;
	}

	// Extension alone is trivially spoofed - check the real file header too.
	private boolean hasMatchingFileSignature(File file, String extension) {
		byte[] header = new byte[8];
		int bytesRead;
		try (FileInputStream in = new FileInputStream(file)) {
			bytesRead = in.read(header);
		} catch (IOException e) {
			return false;
		}
		if (bytesRead < 4) {
			return false;
		}
		if ("pdf".equals(extension)) {
			return header[0] == '%' && header[1] == 'P' && header[2] == 'D' && header[3] == 'F';
		}
		if ("doc".equals(extension)) {
			// Real .doc files always start with these exact 4 bytes.
			return (header[0] & 0xFF) == 0xD0 && (header[1] & 0xFF) == 0xCF && (header[2] & 0xFF) == 0x11
					&& (header[3] & 0xFF) == 0xE0;
		}
		if ("docx".equals(extension)) {
			// Real .docx files always start with these 2 bytes (it's a zip file).
			return header[0] == 'P' && header[1] == 'K';
		}
		return false;
	}

	public String sendEmailJob() {
		boolean redesign = isRedesignPreviewEnabled();
		// Legacy detail.jsp has no jobUrl hidden field - fall back to the list page.
		if (jobUrl == null || jobUrl.trim().isEmpty()) {
			jobUrl = "/careers";
		}
		try {
			loadJobContext(jobId);
		} catch (Exception e) {
			log.error(e);
			request.setAttribute("response", "0");
			if (redesign) {
				return INVALID_JOB;
			}
			return ERROR;
		}

		try {
			ValidationResult nameResult = ContactFormValidator.validateName(contactName);
			ValidationResult emailResult = ContactFormValidator.validateEmail(contactEmail);
			// Telephone is the one optional field - only format-checked if filled in.
			boolean telProvided = contactTel != null && !contactTel.trim().isEmpty();
			ValidationResult telResult = telProvided ? ContactFormValidator.validatePhone(contactTel)
					: ValidationResult.valid(contactTel);
			ValidationResult messageResult = ContactFormValidator.validateMessage(contactMessage);
			String fileError = validateResumeFile(contactFile, contactFileName, redesign);
			// Set by BotProtectionInterceptor (actionfront.xml).
			boolean captchaValid = !redesign || Boolean.TRUE.equals(request.getAttribute("botCheckPassed"));
			boolean allValid = nameResult.isValid() && emailResult.isValid() && telResult.isValid()
					&& messageResult.isValid() && fileError == null && captchaValid;

			Map<String, Object> flash = FlashScope.newMap();

			if (!allValid) {
				// keep what was typed so a validation error doesn't wipe the form
				flash.put("contactName", contactName);
				flash.put("contactEmail", contactEmail);
				flash.put("contactTel", contactTel);
				flash.put("contactMessage", contactMessage);
				flash.put("nameError", nameResult.getErrorMessage());
				flash.put("emailError", emailResult.getErrorMessage());
				flash.put("telError", telResult.getErrorMessage());
				flash.put("messageError", messageResult.getErrorMessage());
				flash.put("fileError", fileError);
				if (!captchaValid) {
					flash.put("captchaError", "Please complete the verification above and try again.");
				}
				FlashScope.put(request, flash);
				return SUCCESS;
			}

			log.debug("Sending job application: name=" + contactName + " email=" + contactEmail + " tel=" + contactTel
					+ " position=" + contactPosition + " resume=" + contactFileName);

			JobApplication app = new JobApplication();
			app.setPosition(contactPosition);
			app.setName(nameResult.getValue());
			app.setEmail(emailResult.getValue());
			app.setTel(telResult.getValue());
			app.setMessage(messageResult.getValue());
			app.setEmailFrom(constant.getEmailJobFrom());
			app.setEmailTo(constant.getEmailJobTo());
			app.setEmailStatus("PENDING");
			app.setTimeCreate(new Timestamp(System.currentTimeMillis()));

			boolean rowSaved = false;
			try {
				jobApplicationDAO.save(app);
				rowSaved = true;
			} catch (Exception dbEx) {
				log.error("job_application insert failed", dbEx);
			}

			if (contactFile != null && rowSaved) {
				try {
					// unguessable name; real name stays in resume_filename
					String stored = UUID.randomUUID().toString() + resumeExtension(contactFileName);
					String realBase = ServletActionContext.getServletContext().getRealPath("/");
					if (realBase != null) {
						FileUtil.upload(contactFile, realBase, "upload/email/" + stored);
						app.setResumeFilename(contactFileName);
						app.setResumePath("upload/email/" + stored);
						app.setResumeSizeBytes(contactFile.length());
					} else {
						log.error("getRealPath('/') is null - resume not stored to disk");
					}
				} catch (Exception fileEx) {
					log.error("resume upload failed", fileEx);
				}
			}

			boolean sent = false;
			try {
				emailService.sendEmailJob(nameResult.getValue(), emailResult.getValue(), telResult.getValue(),
						contactPosition, messageResult.getValue(), contactFile, contactFileName);
				app.setEmailStatus("SUCCESS");
				sent = true;
			} catch (Exception sendEx) {
				log.error("Job mail send failed", sendEx);
				app.setEmailStatus("FAILED");
				app.setEmailError(truncate(sendEx.getMessage(), 512));
			}

			if (rowSaved) {
				try {
					jobApplicationDAO.update(app);
				} catch (Exception dbEx) {
					log.error("job_application update failed", dbEx);
				}
			}

			if (!sent) {
				return sendJobFailedResult(redesign);
			}

			flash.put("response", "1");
			FlashScope.put(request, flash);
			response.setHeader("X-Send-Result", "success");
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return sendJobFailedResult(redesign);
		}
	}

	private String sendJobFailedResult(boolean redesign) {
		request.setAttribute("response", "0");
		// forwarded result - null the fields or the JSP re-reads them off the value stack
		contactName = null;
		contactEmail = null;
		contactTel = null;
		contactMessage = null;
		if (redesign) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.setHeader("X-Error-Reason", "send-failed");
			request.setAttribute("constant", constant);
			request.setAttribute("requestURI", jobUrl);
			request.setAttribute("formError", "Something went wrong - please try again in a moment.");
			return SEND_JOB_FAILED;
		}
		return ERROR;
	}

	private static String truncate(String text, int max) {
		if (text == null || text.length() <= max) {
			return text;
		}
		return text.substring(0, max);
	}

	// extension only - the on-disk name is a UUID
	private static String resumeExtension(String name) {
		if (name == null) {
			return "";
		}
		int dot = name.lastIndexOf('.');
		if (dot < 0) {
			return "";
		}
		String ext = name.substring(dot + 1).toLowerCase();
		return ext.matches("[a-z0-9]{1,8}") ? "." + ext : "";
	}
}
