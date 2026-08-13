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
 * The rate limit counts failures only, never successful submissions - the
 * browser already refuses to submit without a solved captcha, so a shared IP
 * full of real people never trips it; only repeated bot/direct-POST failures do.
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
	private static final Map<String, long[]> HITS = new ConcurrentHashMap<String, long[]>();

	@Autowired
	private Constant constant;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

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
		long[] window = HITS.get(key);
		if (window == null) {
			return false;
		}
		synchronized (window) {
			if (System.currentTimeMillis() - window[0] > WINDOW_MILLIS) {
				return false;
			}
			return window[1] >= MAX_FAILURES_PER_WINDOW;
		}
	}

	// Fixed-window counter: each ip:actionName pair gets MAX_FAILURES_PER_WINDOW
	// failures per WINDOW_MILLIS, then the window resets. Not exact (a burst
	// spanning a window boundary can let slightly more than the cap through),
	// but that imprecision doesn't matter for what this defends against.
	private void recordFailure(String key) {
		long now = System.currentTimeMillis();
		long[] window = HITS.computeIfAbsent(key, k -> new long[] { now, 0 });
		synchronized (window) {
			if (now - window[0] > WINDOW_MILLIS) {
				window[0] = now;
				window[1] = 0;
			}
			window[1]++;
		}
	}
}
