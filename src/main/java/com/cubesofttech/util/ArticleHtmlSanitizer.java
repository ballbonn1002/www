package com.cubesofttech.util;

import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Safelist;

public final class ArticleHtmlSanitizer {

	private static final Set<String> ALLOWED_IFRAME_HOSTS = Collections.unmodifiableSet(new HashSet<String>(
			Arrays.asList("youtube.com", "www.youtube.com", "youtube-nocookie.com", "www.youtube-nocookie.com")));

	private static final Safelist ARTICLE_BODY_SAFELIST = Safelist.relaxed()
			.addAttributes("div", "class")
			.addTags("iframe")
			.addAttributes("iframe", "src", "width", "height", "frameborder", "allow", "allowfullscreen", "title")
			.addProtocols("iframe", "src", "https");

	private ArticleHtmlSanitizer() {
	}

	public static String clean(String rawHtml) {
		if (rawHtml == null || rawHtml.isEmpty()) {
			return "";
		}
		Document doc = Jsoup.parseBodyFragment(rawHtml);
		removeDisallowedDocumentTags(doc);
		stripClassAndStyleAttributes(doc);
		removeEmptySpacerElements(doc);
		removeDisallowedIframes(doc);
		// ส่วนตีความ/ประกอบ FAQ ใหม่แยกไปอยู่คลาส FaqSectionRebuilder แล้ว (คนละหน้าที่กับ sanitize)
		FaqSectionRebuilder.rebuildFaqSections(doc);
		return Jsoup.clean(doc.body().html(), ARTICLE_BODY_SAFELIST);
	}

	public static String toPreviewText(String rawHtml, int maxLength) {
		if (rawHtml == null || rawHtml.isEmpty()) {
			return "";
		}
		Document doc = Jsoup.parseBodyFragment(rawHtml);
		doc.select("script, style, meta, title, link, head").remove();
		String text = doc.body().text().trim();
		if (text.length() <= maxLength) {
			return text;
		}
		String truncated = text.substring(0, maxLength);
		int lastSpace = truncated.lastIndexOf(' ');
		if (lastSpace > 0) {
			truncated = truncated.substring(0, lastSpace);
		}
		return truncated + "...";
	}

	private static void removeDisallowedDocumentTags(Document doc) {
		doc.select("style, script, meta, title, link, head").remove();
	}

	private static void stripClassAndStyleAttributes(Document doc) {
		for (Element el : doc.body().getAllElements()) {
			el.removeAttr("class");
			el.removeAttr("style");
		}
	}

	private static void removeDisallowedIframes(Document doc) {
		for (Element iframe : doc.body().select("iframe")) {
			if (!isAllowedIframeSrc(iframe.attr("src"))) {
				iframe.remove();
			}
		}
	}

	private static boolean isAllowedIframeSrc(String src) {
		try {
			String host = URI.create(src).getHost();
			return host != null && ALLOWED_IFRAME_HOSTS.contains(host.toLowerCase());
		} catch (Exception e) {
			return false;
		}
	}

	private static void removeEmptySpacerElements(Document doc) {
		for (Element el : doc.body().select("h1,h2,h3,h4,h5,h6,p")) {
			if (el.text().trim().isEmpty() && el.select("img").isEmpty()) {
				el.remove();
			}
		}
	}

}
