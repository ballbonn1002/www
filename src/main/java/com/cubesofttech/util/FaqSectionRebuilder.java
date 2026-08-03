package com.cubesofttech.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

final class FaqSectionRebuilder {

	private static final Logger log = Logger.getLogger(FaqSectionRebuilder.class);

	private static final int LABEL_SCAN_LIMIT = 100;

	private static final Pattern LEADING_QA_LABEL = Pattern.compile(
	        "^(?:"
	        + "[qQ]\\s*\\d*\\s*[:.)\\-]?\\s*"                    // Q, Q1, Q1:, Q1 :, Q:, Q1)
	        + "|\\(\\d+\\)\\s*"
	        + "|\\d+[.)\\-]\\s*"
	        + "|[๐-๙]+[.)\\-]\\s*"
	        + "|คำถามที่\\s*\\d*\\s*[:.]?\\s*(?=\\d|[:.]|\\s|$)" // ต้องตามด้วยเลข/colon/space/จบสตริงเท่านั้น
	        + ")+",
	        Pattern.CASE_INSENSITIVE);

	private static final Pattern BR_TAG = Pattern.compile("(?i)<br\\b[^>]*>");
	private static final String[] QUESTION_WORDS_ANYWHERE = { "อย่างไร", "ทำไม", "อะไร", "เท่าไหร่", "เท่าไร", "กี่",
	        "ที่ไหน", "ใคร", "เมื่อไหร่", "เมื่อไร" };

	private static final String[] QUESTION_ENDINGS = { "?", "ไหม", "มั้ย", "หรือไม่", "หรือเปล่า", "รึเปล่า" };

	private static final String FAQ_HEADING_LABEL = "คำถามที่พบบ่อย (FAQ)";

	private FaqSectionRebuilder() {
	}

	static void rebuildFaqSections(Document doc) {
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

	private static boolean isHeadingTag(String tag) {
		return "h1".equalsIgnoreCase(tag) || "h2".equalsIgnoreCase(tag) || "h3".equalsIgnoreCase(tag)
				|| "h4".equalsIgnoreCase(tag);
	}

	private static boolean containsHeadingTag(Element el, String tagName) {
		if (el.tagName().equalsIgnoreCase(tagName)) {
			return true;
		}
		return !el.select(tagName).isEmpty();
	}

	private static boolean looksLikeQuestion(String text) {
		for (String ending : QUESTION_ENDINGS) {
			if (text.endsWith(ending)) {
				return true;
			}
		}
		// คำถามไทยบางแบบไม่ได้ลงท้ายด้วยอนุภาคใน QUESTION_ENDINGS (เช่น "...จากอะไร")
		// แต่คำถามคำนั้นต้องเป็นคำสุดท้ายของประโยคจริงๆ ถึงจะนับ - ถ้ามันโผล่กลางประโยค
		// แล้วมีคำอื่นตามหลังอีก (เช่น "ช่วยอะไรได้จริง") แปลว่าใช้แบบบอกเล่า ไม่ใช่คำถาม
		// ตัดเครื่องหมายวรรคตอนท้ายประโยคออกก่อน (เช่น "?", " ") แล้วค่อยเช็ค endsWith
		String trimmedEnd = text.replaceAll("[\\s?!.\"'“”‘’]+$", "");
		for (String word : QUESTION_WORDS_ANYWHERE) {
			if (trimmedEnd.endsWith(word)) {
				return true;
			}
		}
		return false;
	}

	private static String stripLeadingQaLabel(String text) {
		String head = text.length() > LABEL_SCAN_LIMIT ? text.substring(0, LABEL_SCAN_LIMIT) : text;
		Matcher matcher = LEADING_QA_LABEL.matcher(head);
		String result = matcher.lookingAt() ? text.substring(matcher.end()) : text;
		if (log.isDebugEnabled()) {
			log.debug("FAQ label stripped: [" + text + "] -> [" + result + "]");
		}
		return result;
	}

	private static void rebuildFaqZone(Element faqHeading) {
		String stopTag = faqHeading.tagName();

		// heading อาจถูกห่อด้วย wrapper ของตัวเอง (เช่น <header><h2>FAQ</h2></header>)
		// ที่ทำให้ heading ไม่มี sibling เป็นของตัวเองเลย ถ้าเจอแบบนี้ให้ไต่ขึ้นไปหา
		// ancestor ตัวแรกที่มี sibling จริงๆ แล้วใช้ตัวนั้นเป็นจุดเริ่มสแกนแทน
		Element scopeAnchor = faqHeading;
		while (scopeAnchor.nextElementSibling() == null && scopeAnchor.parent() != null
				&& scopeAnchor.parent().parent() != null) {
			scopeAnchor = scopeAnchor.parent();
		}

		List<Element> zone = new ArrayList<Element>();
		for (Element sibling = scopeAnchor.nextElementSibling(); sibling != null; sibling = sibling
				.nextElementSibling()) {
			// เจอ heading ระดับเดียวกันของ section ถัดไป (ไม่ว่าจะเป็น sibling ตรงๆ
			// หรือถูกห่อซ้อนอยู่ข้างในอีกที เช่น <header><h2>...) ให้หยุดตรงนี้
			if (containsHeadingTag(sibling, stopTag)) {
				break;
			}
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
			boolean isHeadingLeaf = isHeadingTag(leaf.tagName());
			boolean hasTextSignal = looksLikeQuestion(text);
			boolean isQuestion = isHeadingLeaf || hasTextSignal;
			if (isHeadingLeaf && !hasTextSignal && log.isDebugEnabled()) {
				log.debug("FAQ heading trusted by structure only (no question wording): [" + text + "]");
			}
			if (isQuestion || currentItem == null) {
				currentItem = new Element("div").addClass("faq-item");
				rebuilt.appendChild(currentItem);
				Element question = new Element("div").addClass("faq-question");
				question.text(stripLeadingQaLabel(text));
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
		scopeAnchor.after(rebuilt);
	}

	private static void collectTextLeaves(Element el, List<Element> out) {
	    String tag = el.tagName();
	    boolean isBlockTextTag = "h1".equalsIgnoreCase(tag) || "h2".equalsIgnoreCase(tag)
	            || "h3".equalsIgnoreCase(tag) || "h4".equalsIgnoreCase(tag) || "p".equalsIgnoreCase(tag)
	            || "li".equalsIgnoreCase(tag) || "summary".equalsIgnoreCase(tag);
	    if (isBlockTextTag && !el.text().trim().isEmpty()) {
	        if (el.select("br").isEmpty()) {
	            out.add(el);
	            return;
	        }
	        for (String piece : BR_TAG.split(el.html())) {
	            String pieceText = Jsoup.parseBodyFragment(piece).body().text().trim();
	            if (!pieceText.isEmpty()) {
	                out.add(new Element(tag).text(pieceText));
	            }
	        }
	        return;
	    }
	    if ("div".equalsIgnoreCase(tag) && !el.ownText().trim().isEmpty()) {
	        out.add(el);
	        return;
	    }
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
