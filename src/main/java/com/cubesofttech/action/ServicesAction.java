package com.cubesofttech.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PageUriDAO;
import com.cubesofttech.model.PageUri;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.RewriteFilter;
import com.opensymphony.xwork2.ActionSupport;

public class ServicesAction extends ActionSupport {
	public static final String REDESIGN = "redesign";

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();

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

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	private boolean isRedesignPreviewEnabled() {
		return constant.isRedesignEnabled();
	}
}
