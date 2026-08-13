/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.cubesofttech.system;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Weerawat Poompattanapong
 */

public class Constant {
    public static List<String> onlineUserList = new ArrayList<>();
    private String test;
    private String googleApiKey;
    private String webPath;
    private static String webContext;
    private String imgContext;
    private String recaptchaSiteKey;
    private String recaptchaSecretKey;
    private boolean redesignEnabled;

	public boolean isRedesignEnabled() {
		return redesignEnabled;
	}

	public void setRedesignEnabled(boolean redesignEnabled) {
		this.redesignEnabled = redesignEnabled;
	}

	public String getGoogleApiKey() {
		return googleApiKey;
	}

	public void setGoogleApiKey(String googleApiKey) {
		this.googleApiKey = googleApiKey;
	}

	public String getRecaptchaSiteKey() {
		return recaptchaSiteKey;
	}

	public void setRecaptchaSiteKey(String recaptchaSiteKey) {
		this.recaptchaSiteKey = recaptchaSiteKey;
	}

	public String getRecaptchaSecretKey() {
		return recaptchaSecretKey;
	}

	public void setRecaptchaSecretKey(String recaptchaSecretKey) {
		this.recaptchaSecretKey = recaptchaSecretKey;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	public String getWebPath() {
		return webPath;
	}

	public void setWebPath(String webPath) {
		this.webPath = webPath;
	}

	public static String getWebContext() {
		return webContext;
	}

	public void setWebContext(String webContext) {
		Constant.webContext = webContext;
	}

	public String getImgContext() {
		return imgContext;
	}

	public void setImgContext(String imgContext) {
		this.imgContext = imgContext;
	}

}
