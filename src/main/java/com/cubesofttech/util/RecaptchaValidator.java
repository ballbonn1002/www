package com.cubesofttech.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.apache.log4j.Logger;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public final class RecaptchaValidator {

	private static final Logger LOG = Logger.getLogger(RecaptchaValidator.class);
	private static final String VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";

	// Google's public test secret - always passes verification. The real key lives in
	// application.properties; this constant just lets verify() detect if the test key
	// ever ends up configured by mistake, which would otherwise fail silently.
	private static final String TEST_SECRET_KEY = "6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe";

	private RecaptchaValidator() {
	}

	/**
	 * Verifies a "g-recaptcha-response" token server-side against Google. A
	 * missing/blank token (the widget never solved, or the request bypassed
	 * the browser entirely) fails without making a network call.
	 */
	public static boolean verify(String responseToken, String remoteIp, String secretKey) {
		if (TEST_SECRET_KEY.equals(secretKey)) {
			LOG.warn("reCAPTCHA is running on Google's public TEST secret key - every submission "
					+ "will pass regardless of the token. Check that recaptcha.secret.key in "
					+ "application.properties is set to the real key, not the test key.");
		}
		if (responseToken == null || responseToken.trim().isEmpty()) {
			return false;
		}
		try {
			String params = "secret=" + URLEncoder.encode(secretKey, "UTF-8")
					+ "&response=" + URLEncoder.encode(responseToken, "UTF-8")
					+ "&remoteip=" + URLEncoder.encode(remoteIp == null ? "" : remoteIp, "UTF-8");

			HttpURLConnection conn = (HttpURLConnection) new URL(VERIFY_URL).openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			try (OutputStream os = conn.getOutputStream()) {
				os.write(params.getBytes(StandardCharsets.UTF_8));
			}

			StringBuilder body = new StringBuilder();
			try (InputStream is = conn.getInputStream()) {
				byte[] buffer = new byte[1024];
				int read;
				while ((read = is.read(buffer)) != -1) {
					body.append(new String(buffer, 0, read, StandardCharsets.UTF_8));
				}
			}

			JsonObject json = new JsonParser().parse(body.toString()).getAsJsonObject();
			return json.has("success") && json.get("success").getAsBoolean();
		} catch (IOException | RuntimeException e) {
			LOG.error("reCAPTCHA verification failed", e);
			return false;
		}
	}
}
