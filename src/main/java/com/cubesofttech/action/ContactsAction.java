package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.mail.EmailService;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.RewriteFilter;
import com.opensymphony.xwork2.ActionSupport;

public class ContactsAction extends ActionSupport {
	public static final String REDESIGN = "redesign";

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private EmailService emailService;
	@Autowired
	private Constant constant;
	
	private String contactName;
	private String contactEmail;
	private String contactTel;
	private String contactMessage;
	
	public Logger getLog() {
		return log;
	}

	public void setLog(Logger log) {
		this.log = log;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public EmailService getEmailService() {
		return emailService;
	}

	public void setEmailService(EmailService emailService) {
		this.emailService = emailService;
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
			log.debug(contactName+"/"+contactEmail);
			log.debug(contactTel+"/"+contactMessage);
			emailService.sendEmailContact(contactName, contactEmail, contactTel, contactMessage);
			log.debug("end sending email");

			// Both results re-render the same contacts JSP (there's no
			// separate "thank you" view) - it needs the same request
			// attributes init() would have set, or things like the
			// header's active-nav state and ${constant...} image paths
			// come out blank on the page shown right after a submit.
			request.setAttribute("constant", constant);
			request.setAttribute("requestURI", RewriteFilter.getRequestURI(request));

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}

	/**
	 * Internal-only preview toggle: set via /redesign-preview-on (see
	 * RedesignPreviewAction), never exposed as a URL parameter that a regular
	 * visitor could set themselves. Same check as BlogAction's - not shared
	 * via a common base method since BlogAction's copy predates this one.
	 */
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
}
