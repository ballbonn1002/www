package com.cubesofttech.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.mail.EmailService;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.RewriteFilter;
import com.cubesofttech.validation.ContactFormValidator;
import com.cubesofttech.validation.ValidationResult;
import com.opensymphony.xwork2.ActionSupport;

public class ContactsAction extends ActionSupport {
	public static final String REDESIGN = "redesign";

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();

	@Autowired
	private EmailService emailService;
	@Autowired
	private Constant constant;

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
		try {
			ValidationResult firstNameResult = ContactFormValidator.validateFirstName(firstName);
			ValidationResult lastNameResult = ContactFormValidator.validateLastName(lastName);
			ValidationResult emailResult = ContactFormValidator.validateEmail(contactEmail);
			ValidationResult phoneResult = ContactFormValidator.validatePhone(contactTel);
			// Legacy contacts.jsp has no reCAPTCHA widget, so never enforce it there.
			boolean redesign = isRedesignPreviewEnabled();
			boolean captchaValid = !redesign || Boolean.TRUE.equals(request.getAttribute("botCheckPassed"));
			boolean allValid = firstNameResult.isValid() && lastNameResult.isValid() && emailResult.isValid()
					&& phoneResult.isValid() && captchaValid;

			// Re-renders the same JSP (no separate "thank you" view), so it
			// still needs the attributes init() would normally set.
			request.setAttribute("constant", constant);
			request.setAttribute("requestURI", RewriteFilter.getRequestURI(request));

			// Repopulate what was typed so a failed validation doesn't wipe the form.
			request.setAttribute("firstName", firstName);
			request.setAttribute("lastName", lastName);
			request.setAttribute("contactEmail", contactEmail);
			request.setAttribute("contactTel", contactTel);
			request.setAttribute("contactMessage", contactMessage);

			if (!allValid) {
				// null just reads as "no error" to the JSTL ${not empty} checks below.
				request.setAttribute("firstNameError", firstNameResult.getErrorMessage());
				request.setAttribute("lastNameError", lastNameResult.getErrorMessage());
				request.setAttribute("emailError", emailResult.getErrorMessage());
				request.setAttribute("phoneError", phoneResult.getErrorMessage());
				if (!captchaValid) {
					request.setAttribute("captchaError", "Please complete the verification above and try again.");
				}
				return redesign ? REDESIGN : SUCCESS;
			}

			log.debug("Sending contact message: name=" + firstNameResult.getValue() + " " + lastNameResult.getValue()
					+ " email=" + emailResult.getValue() + " tel=" + phoneResult.getValue());
			emailService.sendEmailContact(firstNameResult.getValue(), lastNameResult.getValue(),
					emailResult.getValue(), phoneResult.getValue(), contactMessage);

			request.setAttribute("contactSuccess", "1");
			return redesign ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			log.error(e);
			if (isRedesignPreviewEnabled()) {
				request.setAttribute("constant", constant);
				request.setAttribute("requestURI", RewriteFilter.getRequestURI(request));
				request.setAttribute("firstName", firstName);
				request.setAttribute("lastName", lastName);
				request.setAttribute("contactEmail", contactEmail);
				request.setAttribute("contactTel", contactTel);
				request.setAttribute("contactMessage", contactMessage);
				request.setAttribute("formError", "Something went wrong - please try again in a moment.");
				return REDESIGN;
			}
			return ERROR;
		}
	}

	private boolean isRedesignPreviewEnabled() {
		return constant.isRedesignEnabled();
	}
}
