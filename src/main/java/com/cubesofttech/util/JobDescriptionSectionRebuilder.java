package com.cubesofttech.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/**
 * Legacy job descriptions store "sections" (Responsibilities, Required
 * Qualifications, ...) as either real &lt;ul&gt;/&lt;li&gt; markup or as a
 * flat run of &lt;div&gt;/&lt;p&gt; lines - a heading line, then lines
 * prefixed with "-" or "&bull;" - depending on which editor/era a posting
 * was pasted from. Rebuilds the flat shape into real &lt;h3&gt;/&lt;ul&gt;
 * so .jobdetail-card's CSS (which targets real heading/list tags) renders
 * every posting the same way regardless of which shape it used. Real
 * &lt;ul&gt;/&lt;li&gt; content is left untouched.
 */
public final class JobDescriptionSectionRebuilder {

	private static final int HEADING_MAX_LENGTH = 60;
	private static final Pattern WORD_SPLIT = Pattern.compile("[^a-zA-Z]+");
	private static final Pattern BULLET_PREFIX = Pattern.compile("^[-•]\\s*");

	private JobDescriptionSectionRebuilder() {
	}

	public static void rebuild(Document doc) {
		// A snapshot, not a live view - children get removed/replaced below,
		// which would otherwise skip/duplicate elements mid-iteration.
		List<Element> topLevel = new ArrayList<Element>(doc.body().children());
		Element openList = null;

		for (Element el : topLevel) {
			String tag = el.tagName();
			if (!"div".equals(tag) && !"p".equals(tag)) {
				openList = null;
				continue;
			}

			String text = normalizeWhitespace(el.text());
			if (text.isEmpty()) {
				el.remove();
				continue;
			}

			String withoutBullet = BULLET_PREFIX.matcher(text).replaceFirst("");
			if (!withoutBullet.equals(text)) {
				if (openList == null) {
					openList = new Element("ul");
					el.before(openList);
				}
				Element li = new Element("li");
				li.text(withoutBullet);
				openList.appendChild(li);
				el.remove();
				continue;
			}

			openList = null;
			if (isHeadingLike(text)) {
				Element heading = new Element("h3");
				heading.text(text);
				el.replaceWith(heading);
			} else {
				el.tagName("p");
			}
		}
	}

	// Jsoup's .text() renders &nbsp; as literal U+00A0, which String.trim()
	// does not strip (it only trims chars <= U+0020) - without this, a spacer
	// div containing only &nbsp; would look non-empty.
	private static String normalizeWhitespace(String text) {
		return text.replace(' ', ' ').trim();
	}

	// Same word-by-word idea as JobDescriptionParser.detectHeading (no section-
	// type distinction needed here - just "does this line read as a heading").
	private static boolean isHeadingLike(String text) {
		if (text.length() > HEADING_MAX_LENGTH) {
			return false;
		}
		boolean sawKeyword = false;
		for (String word : WORD_SPLIT.split(text.toLowerCase())) {
			if (word.isEmpty() || "optional".equals(word) || "required".equals(word) || "preferred".equals(word)) {
				continue;
			}
			if (word.startsWith("responsibilit") || word.startsWith("qualification") || word.startsWith("skill")) {
				sawKeyword = true;
			} else {
				return false;
			}
		}
		return sawKeyword;
	}
}
