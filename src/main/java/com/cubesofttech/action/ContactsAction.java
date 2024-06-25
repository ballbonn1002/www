package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.cubesofttech.model.Blog;
import com.opensymphony.xwork2.ActionSupport;

public class ContactsAction extends ActionSupport {
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public String init() {
		List<Blog> blogList = null;
		try {			
			
			
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
}
