package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.JobDAO;
import com.cubesofttech.model.Blog;
import com.cubesofttech.model.Job;
import com.cubesofttech.mail.EmailService;
import com.opensymphony.xwork2.ActionSupport;

public class CareersAction extends ActionSupport {
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private JobDAO jobDAO;
	/*
	@Autowired
	private EmailService emailService;*/
	
	public String init() {
		try {			
			List<Job> jobList = jobDAO.findAll();
			//log.debug(jobList);
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
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String sendEmailJob() {
		try {
			String name = request.getParameter("contactName");
	    	String email = request.getParameter("contactEmail");
	    	String tel = request.getParameter("contactTel");
	    	String position = request.getParameter("contactPosition");
			//emailService.sendEmailJob(name, email,tel, position);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
