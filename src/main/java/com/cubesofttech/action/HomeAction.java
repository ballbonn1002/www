package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.BlogDAO;
import com.cubesofttech.dao.JobDAO;
import com.cubesofttech.model.Blog;
import com.cubesofttech.model.Job;
import com.cubesofttech.system.Constant;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private Constant constant;
	@Autowired
	private BlogDAO blogDAO;
	@Autowired
	private JobDAO jobDAO;
	
	public String init() {
		List<Blog> blogList = null;
		try {			
			blogList = blogDAO.findAllWithPageUri();
			request.setAttribute("blogList", blogList);
			if(blogList != null && !blogList.isEmpty()) {
				request.setAttribute("newBlog", blogList.get(0));
			}
			
			List<Job> jobList = jobDAO.findAllWithPageUri();
			//log.debug(jobList);
			request.setAttribute("jobList", jobList);
			request.setAttribute("constant", constant);
			
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
}
