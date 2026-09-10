package com.cubesofttech.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cubesofttech.system.Constant;

public class FormSubmitFailure {

	private FormSubmitFailure() {
	}

	public static void markRedesignFailure(HttpServletRequest request, HttpServletResponse response,
			Constant constant, String requestURI) {
		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		response.setHeader("X-Error-Reason", "send-failed");
		request.setAttribute("constant", constant);
		request.setAttribute("requestURI", requestURI);
		request.setAttribute("formError", "Something went wrong - please try again in a moment.");
	}
}
