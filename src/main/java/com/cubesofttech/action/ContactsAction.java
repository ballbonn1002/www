package com.cubesofttech.action;

import java.util.List;

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
			
			return SUCCESS;
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
			
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
}
