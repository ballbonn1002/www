package com.cubesofttech.action;

import javax.servlet.http.Cookie;
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
	public static final String REDESIGN = "redesign";

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

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	/**
	 * Internal-only preview toggle: set via /redesign-preview-on (see
	 * RedesignPreviewAction), never exposed as a URL parameter that a regular
	 * visitor could set themselves. Same check as HomeAction's.
	 */
	private boolean isRedesignPreviewEnabled() {
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			return false;
		}
		for (Cookie cookie : cookies) {
			if (RedesignPreviewAction.COOKIE_NAME.equals(cookie.getName()) && "1".equals(cookie.getValue())) {
				return true;
			}
		}
		return false;
	}
}
