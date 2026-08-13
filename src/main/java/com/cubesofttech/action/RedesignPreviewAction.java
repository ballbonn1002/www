package com.cubesofttech.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

// Lets internal reviewers opt into redesigned pages via a cookie, without
// affecting regular visitors, for as long as the cookie lasts.
public class RedesignPreviewAction extends ActionSupport {

	public static final String COOKIE_NAME = "redesignPreview";
	private static final int COOKIE_MAX_AGE_SECONDS = 30 * 24 * 60 * 60;

	public String on() {
		setCookieAndRedirectBack("1", COOKIE_MAX_AGE_SECONDS);
		return NONE;
	}

	public String off() {
		setCookieAndRedirectBack("", 0);
		return NONE;
	}

	private void setCookieAndRedirectBack(String value, int maxAgeSeconds) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		Cookie cookie = new Cookie(COOKIE_NAME, value);
		cookie.setPath("/");
		cookie.setMaxAge(maxAgeSeconds);
		response.addCookie(cookie);

		String referer = request.getHeader("Referer");
		try {
			response.sendRedirect(referer != null ? referer : "/");
		} catch (Exception e) {
			// ignore - worst case the user stays on the toggle URL
		}
	}
}
