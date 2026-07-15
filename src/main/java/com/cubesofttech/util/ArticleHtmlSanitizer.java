package com.cubesofttech.util;

import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Safelist;

/**
 * Cleans article body HTML coming from external content sources.
 *
 * Source articles arrive with their own ad-hoc classnames and inline styles
 * that differ per article, so none of it is trusted: every class/style
 * attribute is stripped and the result renders through the site's
 * .article-body stylesheet, which styles plain semantic tags (h2, p, ul,
 * blockquote, table, ...) directly.
 *
 * The one exception is the FAQ section, which every source article has but
 * marks up differently (a div.faq-question here, a numbered h3 there, a
 * plain "Q:" prefix, extra wrapper divs elsewhere). Rather than trying to
 * whitelist every tag/classname variant, it's detected by content: a heading
 * mentioning FAQ, followed by lines that end in "?" (questions) each paired
 * with the line(s) after it (the answer) - the one thing every variant seen
 * has in common regardless of markup. It's rebuilt from scratch as plain
 * question/answer pairs, so the classes on that rebuilt markup are ours, not
 * the source's, and safe to style.
 */
public final class ArticleHtmlSanitizer {

	// Strips whatever the source used to label a question: "Q:", "Q.", plain "Q ",
	// "1.", "1)", "(1)", "1-", Thai numerals ("๑."), or the Thai phrase "คำถามที่ 1:" —
	// in any combination, since some sources stack more than one of these.
	private static final Pattern LEADING_QA_LABEL = Pattern.compile(
	        "^(?:"
	        + "[qQ]\\s*\\d*\\s*[:.)\\-]?\\s*"                    // Q, Q1, Q1:, Q1 :, Q:, Q1)
	        + "|\\(\\d+\\)\\s*"
	        + "|\\d+[.)\\-]\\s*"
	        + "|[๐-๙]+[.)\\-]\\s*"
	        + "|คำถามที่\\s*\\d*\\s*[:.]?\\s*(?=\\d|[:.]|\\s|$)" // ต้องตามด้วยเลข/colon/space/จบสตริงเท่านั้น
	        + ")+",
	        Pattern.CASE_INSENSITIVE);

	// Thai yes/no questions are often written without a literal "?" at all,
	// relying on a trailing particle instead (e.g. "...ทำได้ไหม").
	private static final String[] QUESTION_ENDINGS = { "?", "ไหม", "มั้ย", "หรือไม่", "หรือเปล่า", "รึเปล่า" };

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
		stripClassAndStyleAttributes(doc);
		removeEmptySpacerElements(doc);
		removeDisallowedIframes(doc);
		rebuildFaqSections(doc);
		return Jsoup.clean(doc.body().html(), ARTICLE_BODY_SAFELIST);
	}

	/**
	 * Plain-text teaser for listing/preview cards - not a smaller version of
	 * clean(). A preview card has no business rendering formatted HTML (any
	 * tag/attribute that slips through is one more way a source article can
	 * break a card it wasn't designed for), and stripping to text also makes
	 * the excerpt length predictable, which HTML of arbitrary structure never
	 * is.
	 */
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

	/**
	 * Runs before everything else so no source classname/inline style can
	 * survive. Anything reintroduced after this point (the FAQ rebuild) is
	 * markup this class generated itself, not the source's.
	 */
	private static void stripClassAndStyleAttributes(Document doc) {
		for (Element el : doc.body().getAllElements()) {
			el.removeAttr("class");
			el.removeAttr("style");
		}
	}

	/**
	 * iframes are only kept when they point at a known-safe video host;
	 * anything else (arbitrary embeds, trackers, phishing pages) is dropped
	 * entirely rather than trusting whatever src the source content came with.
	 */
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

	/**
	 * Some sources pad vertical rhythm with empty heading/paragraph tags
	 * (e.g. "<h2><br></h2>" right before the real "<h2>") to control spacing
	 * under their own stylesheet. Once that stylesheet is stripped, these
	 * become blank heading-sized gaps under the central style instead, so
	 * they're removed rather than rendered.
	 */
	private static void removeEmptySpacerElements(Document doc) {
		for (Element el : doc.body().select("h1,h2,h3,h4,h5,h6,p")) {
			if (el.text().trim().isEmpty() && el.select("img").isEmpty()) {
				el.remove();
			}
		}
	}

	private static final String FAQ_HEADING_LABEL = "คำถามที่พบบ่อย (FAQ)";

	private static void rebuildFaqSections(Document doc) {
		for (Element heading : doc.body().select("h1,h2,h3,h4")) {
			if (isFaqHeading(heading.text())) {
				heading.text(FAQ_HEADING_LABEL);
				rebuildFaqZone(heading);
			}
		}
	}

	private static boolean isFaqHeading(String headingText) {
		String lower = headingText.toLowerCase();
		return lower.contains("faq") || lower.contains("frequently asked questions")
				|| headingText.contains("คำถามที่พบบ่อย");
	}

	private static boolean looksLikeQuestion(String text) {
		for (String ending : QUESTION_ENDINGS) {
			if (text.endsWith(ending)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Collects every sibling after the FAQ heading up to the next heading of
	 * the same level, flattens them down to the text-bearing leaf elements
	 * (skipping wrapper divs with no text of their own, regardless of how
	 * many layers deep the source nested things), then pairs them up by
	 * content: any leaf whose text ends in "?" starts a new question, every
	 * leaf after it becomes part of that answer until the next "?" leaf.
	 */
	private static void rebuildFaqZone(Element faqHeading) {
		String stopTag = faqHeading.tagName();
		List<Element> zone = new ArrayList<Element>();
		for (Element sibling = faqHeading.nextElementSibling(); sibling != null
				&& !sibling.tagName().equalsIgnoreCase(stopTag); sibling = sibling.nextElementSibling()) {
			zone.add(sibling);
		}
		if (zone.isEmpty()) {
			return;
		}

		List<Element> leaves = new ArrayList<Element>();
		for (Element el : zone) {
			collectTextLeaves(el, leaves);
		}
		if (leaves.isEmpty()) {
			return;
		}

		Element rebuilt = new Element("div");
		Element currentItem = null;
		for (Element leaf : leaves) {
			String text = leafText(leaf).trim();
			boolean isQuestion = looksLikeQuestion(text);
			if (isQuestion || currentItem == null) {
				currentItem = new Element("div").addClass("faq-item");
				rebuilt.appendChild(currentItem);
				Element question = new Element("div").addClass("faq-question");
				question.text(LEADING_QA_LABEL.matcher(text).replaceFirst(""));
				currentItem.appendChild(question);
			} else {
				Element answer = new Element("p");
				answer.text(text);
				currentItem.appendChild(answer);
			}
		}

		for (Element el : zone) {
			el.remove();
		}
		faqHeading.after(rebuilt);
	}

	/**
	 * p/li/headings are treated as one leaf using their full text (including
	 * any inline strong/span children); a div is only a leaf when it carries
	 * direct text of its own, otherwise it's just a wrapper to recurse into.
	 */
	private static void collectTextLeaves(Element el, List<Element> out) {
	    String tag = el.tagName();
	    boolean isBlockTextTag = "h1".equalsIgnoreCase(tag) || "h2".equalsIgnoreCase(tag)
	            || "h3".equalsIgnoreCase(tag) || "h4".equalsIgnoreCase(tag) || "p".equalsIgnoreCase(tag)
	            || "li".equalsIgnoreCase(tag) || "summary".equalsIgnoreCase(tag);
	    if (isBlockTextTag && !el.text().trim().isEmpty()) {
	        out.add(el);
	        return;
	    }
	    if ("div".equalsIgnoreCase(tag) && !el.ownText().trim().isEmpty()) {
	        out.add(el);
	        return;
	    }
	    // Fallback: element ไม่มี child element เลย (เช่น strong/b/span ล้วน ๆ)
	    // แต่มีข้อความ ให้ถือเป็น leaf ด้วย ไม่งั้นข้อความจะหายไปเงียบ ๆ
	    if (el.children().isEmpty() && !el.text().trim().isEmpty()) {
	        out.add(el);
	        return;
	    }
	    for (Element child : el.children()) {
	        collectTextLeaves(child, out);
	    }
	}

	private static String leafText(Element leaf) {
		return "div".equalsIgnoreCase(leaf.tagName()) ? leaf.ownText() : leaf.text();
	}
}
