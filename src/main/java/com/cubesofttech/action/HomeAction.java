package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.Cookie;
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
import com.cubesofttech.util.RewriteFilter;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {
	public static final String REDESIGN = "redesign";

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
			// header.jsp's navbar needs this to render "Home" active - every
			// other action already sets it, this one just never did.
			request.setAttribute("requestURI", RewriteFilter.getRequestURI(request));

			blogList = blogDAO.findAllWithPageUri();
			request.setAttribute("blogList", blogList);
			if(blogList != null && !blogList.isEmpty()) {
				request.setAttribute("newBlog", blogList.get(0));
			}
			
			List<Job> jobList = jobDAO.findAllWithPageUri();
			request.setAttribute("jobList", jobList);
			request.setAttribute("constant", constant);

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	// Internal-only toggle, set via /redesign-preview-on - never exposed
	// as a URL parameter. Same check as ContactsAction's.
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
