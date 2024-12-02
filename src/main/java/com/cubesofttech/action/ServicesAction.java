package com.cubesofttech.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PageUriDAO;
import com.cubesofttech.model.PageUri;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.RewriteFilter;
import com.opensymphony.xwork2.ActionSupport;

public class ServicesAction extends ActionSupport {
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private Constant constant;
	
	@Autowired
	private PageUriDAO pageUriDAO;
	
	public String init() {
		
		try {
			request.setAttribute("constant", constant);
			log.debug(constant.getWebPath());
			String requestURI = RewriteFilter.getRequestURI(request);
			log.debug(requestURI);
			request.setAttribute("requestURI", requestURI);
			
			PageUri page = pageUriDAO.findById(requestURI);
			log.debug(page);

			request.setAttribute("page", page);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
