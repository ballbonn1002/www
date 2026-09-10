package com.cubesofttech.action;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.ContactMessageDAO;
import com.cubesofttech.mail.EmailService;
import com.cubesofttech.model.ContactMessage;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.FlashScope;
import com.cubesofttech.util.FormSubmitFailure;
import com.cubesofttech.util.RewriteFilter;
import com.cubesofttech.util.StringUtil;
import com.cubesofttech.validation.ContactFormValidator;
import com.cubesofttech.validation.ValidationResult;
import com.opensymphony.xwork2.ActionSupport;

public class ContactsAction extends ActionSupport {
	public static final String REDESIGN = "redesign";
	public static final String SEND_FAILED = "sendFailed";

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private EmailService emailService;
	@Autowired
	private Constant constant;
	@Autowired
	private ContactMessageDAO contactMessageDAO;

	private String firstName;
	private String lastName;
	private String contactEmail;
	private String contactTel;
	private String contactMessage;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public String getContactMessage() {
		return contactMessage;
	}

	public void setContactMessage(String contactMessage) {
		this.contactMessage = contactMessage;
	}

	public String init() {
		try {
			FlashScope.applyToRequest(request);
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

	public String sendEmailContact() {
		boolean redesign = isRedesignPreviewEnabled();
		try {
			ValidationResult firstNameResult = ContactFormValidator.validateFirstName(firstName);
			ValidationResult lastNameResult = ContactFormValidator.validateLastName(lastName);
			ValidationResult emailResult = ContactFormValidator.validateEmail(contactEmail);
			ValidationResult phoneResult = ContactFormValidator.validatePhone(contactTel);
			ValidationResult messageResult = ContactFormValidator.validateMessage(contactMessage);
			// Legacy contacts.jsp has no reCAPTCHA widget, so never enforce it there.
			boolean captchaValid = !redesign || Boolean.TRUE.equals(request.getAttribute("botCheckPassed"));
			boolean allValid = firstNameResult.isValid() && lastNameResult.isValid() && emailResult.isValid()
					&& phoneResult.isValid() && messageResult.isValid() && captchaValid;

			Map<String, Object> flash = FlashScope.newMap();

			if (!allValid) {
				flash.put("firstName", firstName);
				flash.put("lastName", lastName);
				flash.put("contactEmail", contactEmail);
				flash.put("contactTel", contactTel);
				flash.put("contactMessage", contactMessage);
				// null just reads as "no error" to the JSTL ${not empty} checks below.
				flash.put("firstNameError", firstNameResult.getErrorMessage());
				flash.put("lastNameError", lastNameResult.getErrorMessage());
				flash.put("emailError", emailResult.getErrorMessage());
				flash.put("phoneError", phoneResult.getErrorMessage());
				flash.put("messageError", messageResult.getErrorMessage());
				if (!captchaValid) {
					flash.put("captchaError", "Please complete the verification above and try again.");
				}
				FlashScope.put(request, flash);
				return SUCCESS;
			}

			log.debug("Sending contact message: name=" + firstNameResult.getValue() + " " + lastNameResult.getValue()
					+ " email=" + emailResult.getValue() + " tel=" + phoneResult.getValue());

			ContactMessage entry = buildContactMessageEntry(firstNameResult, lastNameResult, emailResult,
					phoneResult, messageResult);

			boolean sent = false;
			try {
				emailService.sendEmailContact(firstNameResult.getValue(), lastNameResult.getValue(),
						emailResult.getValue(), phoneResult.getValue(), messageResult.getValue());
				entry.setEmailStatus("SUCCESS");
				sent = true;
			} catch (Exception sendEx) {
				log.error("Contact mail send failed", sendEx);
				entry.setEmailStatus("FAILED");
				entry.setEmailError(StringUtil.truncate(sendEx.getMessage(), 512));
			}

			try {
				contactMessageDAO.save(entry);
			} catch (Exception dbEx) {
				log.error("contact_message save failed", dbEx);
			}

			if (!sent) {
				return sendFailedResult(redesign);
			}

			flash.put("contactSuccess", "1");
			FlashScope.put(request, flash);
			response.setHeader("X-Send-Result", "success");
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return sendFailedResult(redesign);
		}
	}

	private ContactMessage buildContactMessageEntry(ValidationResult firstNameResult, ValidationResult lastNameResult,
			ValidationResult emailResult, ValidationResult phoneResult, ValidationResult messageResult) {
		ContactMessage entry = new ContactMessage();
		entry.setFirstName(firstNameResult.getValue());
		entry.setLastName(lastNameResult.getValue());
		entry.setEmail(emailResult.getValue());
		entry.setTel(phoneResult.getValue());
		entry.setMessage(messageResult.getValue());
		entry.setEmailFrom(constant.getEmailContactFrom());
		entry.setEmailTo(constant.getEmailContactTo());
		entry.setTimeCreate(new Timestamp(System.currentTimeMillis()));
		return entry;
	}

	private String sendFailedResult(boolean redesign) {
		// forwarded result - null the fields or the JSP re-reads them off the value stack
		firstName = null;
		lastName = null;
		contactEmail = null;
		contactTel = null;
		contactMessage = null;
		if (redesign) {
			FormSubmitFailure.markRedesignFailure(request, response, constant, "/contacts");
			return SEND_FAILED;
		}
		Map<String, Object> flash = FlashScope.newMap();
		flash.put("formError", "Something went wrong - please try again in a moment.");
		FlashScope.put(request, flash);
		return SUCCESS;
	}

	private boolean isRedesignPreviewEnabled() {
		return constant.isRedesignEnabled();
	}
}
