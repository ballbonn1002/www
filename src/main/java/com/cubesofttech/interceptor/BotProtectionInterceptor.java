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
 * Runs before any action mapped to it in actionfront.xml (sendEmailContact,
 * sendEmailJob) and decides whether the submission looks like a bot, so that
 * check doesn't have to be copy-pasted into every form-handling action.
 *
 * Three layers, cheapest first:
 * 1. Honeypot field ("hpToken") - real users never see or fill it (off-screen
 *    in CSS); a filled value means whatever submitted this didn't render the
 *    page like a browser.
 * 2. Per-IP, per-action rate limit - contacts and careers get separate
 *    budgets, since they're unrelated user intents and a shared IP
 *    (office/NAT) shouldn't get blocked on one because of the other.
 * 3. reCAPTCHA token verification (same Google call ContactsAction/
 *    CareersAction used to make individually).
 *
 * The verdict is stored on the request as "botCheckPassed" (Boolean) for the
 * action to read - the action still runs either way, since it also needs to
 * populate the same "constant"/repopulated-field attributes on a rejected
 * submission that it does on any other validation failure.
 */
public class BotProtectionInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	private static final Logger LOG = Logger.getLogger(BotProtectionInterceptor.class);

	private static final int MAX_SUBMISSIONS_PER_WINDOW = 5;
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
		String honeypot = request.getParameter("hpToken");
		String captchaToken = request.getParameter("g-recaptcha-response");

		boolean passed;
		String failReason = null;
		if (honeypot != null && !honeypot.trim().isEmpty()) {
			LOG.warn("Honeypot field filled from " + ip + " - treating as a bot");
			passed = false;
			failReason = "captcha";
		} else if (isRateLimited(ip, actionName)) {
			LOG.warn("Rate limit exceeded for " + ip + " on " + actionName);
			passed = false;
			failReason = "rateLimit";
		} else {
			passed = RecaptchaValidator.verify(captchaToken, ip, constant.getRecaptchaSecretKey());
			if (!passed) {
				failReason = "captcha";
			}
		}

		request.setAttribute("botCheckPassed", passed);
		request.setAttribute("botCheckFailReason", failReason);
		return invocation.invoke();
	}

	// Fixed-window counter: each ip:actionName pair gets MAX_SUBMISSIONS_PER_WINDOW
	// hits per WINDOW_MILLIS, then the window resets. Not exact (a burst spanning
	// a window boundary can let slightly more than the cap through), but that
	// imprecision doesn't matter for what this defends against.
	private boolean isRateLimited(String ip, String actionName) {
		String key = ip + ":" + actionName;
		long now = System.currentTimeMillis();
		long[] window = HITS.computeIfAbsent(key, k -> new long[] { now, 0 });
		synchronized (window) {
			if (now - window[0] > WINDOW_MILLIS) {
				window[0] = now;
				window[1] = 0;
			}
			window[1]++;
			return window[1] > MAX_SUBMISSIONS_PER_WINDOW;
		}
	}
}
