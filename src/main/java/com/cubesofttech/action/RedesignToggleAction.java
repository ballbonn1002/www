package com.cubesofttech.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.system.Constant;
import com.opensymphony.xwork2.ActionSupport;

// Temporary SA-testing switch: flips the in-memory redesign.enabled flag for
// every visitor on this server, for as long as Tomcat stays up. Does not
// touch application.properties, so a restart reverts to the file's value.
public class RedesignToggleAction extends ActionSupport {

	@Autowired
	private Constant constant;

	public String toggle() {
		constant.setRedesignEnabled(!constant.isRedesignEnabled());

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String referer = request.getHeader("Referer");
		try {
			response.sendRedirect(referer != null ? referer : "/");
		} catch (Exception e) {
			// ignore - worst case the user stays on the toggle URL
		}
		return NONE;
	}
}
