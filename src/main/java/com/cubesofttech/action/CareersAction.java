package com.cubesofttech.action;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.JobDAO;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.Job;
import com.cubesofttech.util.FileUtil;
import com.cubesofttech.mail.EmailService;
import com.opensymphony.xwork2.ActionSupport;

public class CareersAction extends ActionSupport {
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private JobDAO jobDAO;
	@Autowired
	public FileUploadDAO fileuploadDAO;
	@Autowired
	private EmailService emailService;
	
	private String contactName;
	private String contactEmail;
	private String contactTel;
	private String contactPosition;
	private String contactMessage;
	private String contactFile;

	private File fileUpload;
	private String fileUploadFileName;
	private String fileUploadSize;
		
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
	/*
	public File getContactFile() {
		return contactFile;
	}

	public void setContactFile(File contactFile) {
		this.contactFile = contactFile;
	}
	*/
	public String getContactFile() {
		return contactFile;
	}

	public void setContactFile(String contactFile) {
		this.contactFile = contactFile;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}
	
	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	
	public String getFileUploadSize() {
		return fileUploadSize;
	}

	public void setFileUploadSize(String fileUploadSize) {
		this.fileUploadSize = fileUploadSize;
	}

	public String init() {
		try {			
			List<Job> jobList = jobDAO.findAll();
			request.setAttribute("jobList", jobList);
			
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

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String sendEmailJob() {
		try {
			
	    	log.debug("email service is initiated : " +  emailService);	
	    	log.debug("name : " + contactName);
	    	log.debug("email : " + contactEmail);
	    	log.debug("tel : " + contactTel);
	    	log.debug("position : " + contactPosition);
	    	log.debug("message : " + contactMessage);
	    	log.debug("file : " + contactFile);
	    	
	    	emailService.sendEmailJob(contactName, contactEmail, contactTel, contactPosition, contactMessage, contactFile);
	    	request.setAttribute("response", "1");
	    	return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("response", "0");
			return ERROR;
		}
	}
}
