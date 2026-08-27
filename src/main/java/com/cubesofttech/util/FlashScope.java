package com.cubesofttech.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

// Carries request attributes across a redirect (Post/Redirect/Get).
public class FlashScope {

	private static final String SESSION_KEY = "flashScope";

	private FlashScope() {
	}

	public static void put(HttpServletRequest request, Map<String, Object> data) {
		request.getSession().setAttribute(SESSION_KEY, data);
	}

	@SuppressWarnings("unchecked")
	public static void applyToRequest(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}
		Map<String, Object> data = (Map<String, Object>) session.getAttribute(SESSION_KEY);
		if (data == null) {
			return;
		}
		session.removeAttribute(SESSION_KEY);
		for (Map.Entry<String, Object> entry : data.entrySet()) {
			request.setAttribute(entry.getKey(), entry.getValue());
		}
	}

	public static Map<String, Object> newMap() {
		return new HashMap<String, Object>();
	}
}
