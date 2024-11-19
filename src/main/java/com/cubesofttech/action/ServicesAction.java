package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.model.Blog;
import com.cubesofttech.system.Constant;
import com.opensymphony.xwork2.ActionSupport;

public class ServicesAction extends ActionSupport {
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private Constant constant;
	
	public String init() {
		
		try {			
			request.setAttribute("constant", constant);
			log.debug(constant.getWebPath());
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			return ERROR;
		}
	}
}
