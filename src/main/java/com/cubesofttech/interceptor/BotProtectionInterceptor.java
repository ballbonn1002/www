package com.cubesofttech.interceptor;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.system.Constant;
import com.cubesofttech.util.RecaptchaValidator;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * Shared bot check for sendEmailContact/sendEmailJob (wired in actionfront.xml):
 * honeypot field, then per-IP-per-action rate limit, then reCAPTCHA verify.
 *
 * The rate limit counts failures only - a solved captcha is required to
 * submit, so real traffic never trips it, only bots/direct-POST attempts.
 * Skipped outside redesign mode, since legacy forms have no widget to check.
 *
 * Verdict goes on the request as "botCheckPassed" - the action still runs
 * either way, since it needs to re-populate the same fields it would on any
 * other validation failure.
 */
public class BotProtectionInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	private static final Logger LOG = Logger.getLogger(BotProtectionInterceptor.class);

	private static final int MAX_FAILURES_PER_WINDOW = 5;
	private static final long WINDOW_MILLIS = 10 * 60 * 1000L; // 10 minutes

	// Keyed "ip:actionName" (see class javadoc). In-memory and per-instance
	// only - a multi-instance deployment would need a shared store instead.
	private static final Map<String, FailureWindow> HITS = new ConcurrentHashMap<String, FailureWindow>();

	private static final class FailureWindow {
		long windowStart;
		int count;
	}

	@Autowired
	private Constant constant;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		// Legacy has no widget to check - skip, so it doesn't pollute the
		// shared ip:actionName failure budget below.
		if (!constant.isRedesignEnabled()) {
			request.setAttribute("botCheckPassed", true);
			return invocation.invoke();
		}

		String ip = request.getRemoteAddr();
		String actionName = invocation.getProxy().getActionName();
		String key = ip + ":" + actionName;
		String honeypot = request.getParameter("hpToken");
		String captchaToken = request.getParameter("g-recaptcha-response");

		boolean passed;
		if (isRateLimited(key)) {
			LOG.warn("Rate limit exceeded for " + ip + " on " + actionName);
			passed = false;
		} else if (honeypot != null && !honeypot.trim().isEmpty()) {
			LOG.warn("Honeypot field filled from " + ip + " - treating as a bot");
			passed = false;
			recordFailure(key);
		} else {
			passed = RecaptchaValidator.verify(captchaToken, ip, constant.getRecaptchaSecretKey());
			if (!passed) {
				recordFailure(key);
			}
		}

		request.setAttribute("botCheckPassed", passed);
		return invocation.invoke();
	}

	// Read-only check - does not itself count as a failure, so checking never
	// consumes budget on its own.
	private boolean isRateLimited(String key) {
		FailureWindow window = HITS.get(key);
		if (window == null) {
			return false;
		}
		synchronized (window) {
			if (System.currentTimeMillis() - window.windowStart > WINDOW_MILLIS) {
				return false;
			}
			return window.count >= MAX_FAILURES_PER_WINDOW;
		}
	}

	// Fixed-window counter: MAX_FAILURES_PER_WINDOW per WINDOW_MILLIS, then
	// resets. Imprecise at window boundaries, fine for what this defends against.
	private void recordFailure(String key) {
		long now = System.currentTimeMillis();
		FailureWindow window = HITS.computeIfAbsent(key, k -> {
			FailureWindow w = new FailureWindow();
			w.windowStart = now;
			return w;
		});
		synchronized (window) {
			if (now - window.windowStart > WINDOW_MILLIS) {
				window.windowStart = now;
				window.count = 0;
			}
			window.count++;
		}
	}
}
