package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.mail.EmailService;
import com.cubesofttech.model.Blog;
import com.opensymphony.xwork2.ActionSupport;

public class ContactsAction extends ActionSupport {
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	private String contactName;
	private String contactEmail;
	private String contactTel;
	private String contactMessage;

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

	@Autowired
	private EmailService emailService;
	
	public String init() {
		List<Blog> blogList = null;
		try {			
			
			
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
			
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
}
