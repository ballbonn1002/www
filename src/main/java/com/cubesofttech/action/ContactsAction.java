package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.mail.EmailService;
import com.opensymphony.xwork2.ActionSupport;

public class ContactsAction extends ActionSupport {
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private EmailService emailService;
	
	private String contactName;
	private String contactEmail;
	private String contactTel;
	private String contactMessage;
	
	public String init() {
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
