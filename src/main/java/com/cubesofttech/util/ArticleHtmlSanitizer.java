package com.cubesofttech.util;

import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Safelist;

public final class ArticleHtmlSanitizer {

	private static final Set<String> ALLOWED_IFRAME_HOSTS = Collections.unmodifiableSet(new HashSet<String>(
			Arrays.asList("youtube.com", "www.youtube.com", "youtube-nocookie.com", "www.youtube-nocookie.com")));

	private static final String[] TEXT_ALIGN_TAGS = { "p", "div", "h1", "h2", "h3", "h4", "h5", "h6" };

	private static final String[] FONT_SIZE_TAGS = { "p", "div", "span", "strong", "em", "i", "b", "li", "h1", "h2",
			"h3", "h4", "h5", "h6", "blockquote", "td", "th" };

	private static final Pattern WIDTH_STYLE_PATTERN = Pattern.compile("width\\s*:\\s*([\\d.]+)(px|%)?");

	private static final Pattern TEXT_ALIGN_STYLE_PATTERN = Pattern
			.compile("text-align\\s*:\\s*(left|right|center|justify)", Pattern.CASE_INSENSITIVE);

	private static final Pattern FONT_SIZE_STYLE_PATTERN = Pattern
			.compile("font-size\\s*:\\s*([\\d.]+(?:px|em|rem|%|pt))", Pattern.CASE_INSENSITIVE);

	private static final Safelist ARTICLE_BODY_SAFELIST = buildSafelist();

	private ArticleHtmlSanitizer() {
	}

	public static String clean(String rawHtml, String baseUri) {
		if (rawHtml == null || rawHtml.isEmpty()) {
			return "";
		}
		Document doc = Jsoup.parseBodyFragment(rawHtml);
		removeDisallowedDocumentTags(doc);
		stripClassAndStyleAttributes(doc);
		removeEmptySpacerElements(doc);
		removeDisallowedIframes(doc);
		FaqSectionRebuilder.rebuildFaqSections(doc);
		return Jsoup.clean(doc.body().html(), baseUri, ARTICLE_BODY_SAFELIST);
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

	private static Safelist buildSafelist() {
		Safelist safelist = Safelist.relaxed()
				.addAttributes("div", "class")
				.addTags("iframe", "hr")
				.addAttributes("iframe", "src", "width", "height", "frameborder", "allow", "allowfullscreen", "title")
				.addProtocols("iframe", "src", "https");
		for (String tag : TEXT_ALIGN_TAGS) {
			safelist.addAttributes(tag, "align");
		}
		for (String tag : FONT_SIZE_TAGS) {
			safelist.addAttributes(tag, "style");
		}
		return safelist;
	}

	private static void removeDisallowedDocumentTags(Document doc) {
		doc.select("style, script, meta, title, link, head").remove();
	}

	private static void stripClassAndStyleAttributes(Document doc) {
		for (Element el : doc.body().getAllElements()) {
			if (("span".equals(el.tagName()) || "font".equals(el.tagName())) && isBoldStyle(el.attr("style"))) {
				el.tagName("strong");
			}
			if ("img".equals(el.tagName())) {
				preserveWidthAttribute(el);
			}
			if (Arrays.asList(TEXT_ALIGN_TAGS).contains(el.tagName())) {
				preserveTextAlignAttribute(el);
			}
			String fontSize = Arrays.asList(FONT_SIZE_TAGS).contains(el.tagName()) ? extractFontSize(el.attr("style"))
					: null;
			el.removeAttr("class");
			el.removeAttr("style");
			if (fontSize != null) {
				el.attr("style", "font-size:" + fontSize + ";");
			}
		}
	}

	private static String extractFontSize(String style) {
		Matcher matcher = FONT_SIZE_STYLE_PATTERN.matcher(style);
		return matcher.find() ? matcher.group(1) : null;
	}

	private static void preserveWidthAttribute(Element img) {
		if (img.hasAttr("width")) {
			return;
		}
		Matcher matcher = WIDTH_STYLE_PATTERN.matcher(img.attr("style"));
		if (matcher.find()) {
			String value = matcher.group(1);
			String unit = matcher.group(2);
			img.attr("width", "%".equals(unit) ? value + "%" : value);
		}
	}

	private static void preserveTextAlignAttribute(Element el) {
		if (el.hasAttr("align")) {
			return;
		}
		Matcher matcher = TEXT_ALIGN_STYLE_PATTERN.matcher(el.attr("style"));
		if (matcher.find()) {
			el.attr("align", matcher.group(1).toLowerCase());
		}
	}

	private static boolean isBoldStyle(String style) {
		if (style == null || style.isEmpty()) {
			return false;
		}
		String normalized = style.toLowerCase().replace(" ", "");
		return normalized.contains("font-weight:bold") || normalized.contains("font-weight:700")
				|| normalized.contains("font-weight:800") || normalized.contains("font-weight:900");
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
