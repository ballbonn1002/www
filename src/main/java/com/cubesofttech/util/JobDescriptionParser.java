package com.cubesofttech.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.cubesofttech.model.JobRequirements;

// Best-effort HTML-to-JobRequirements extraction; a migration aid reviewed by a human, not auto-applied.
public final class JobDescriptionParser {

	private enum Bucket {
		RESPONSIBILITIES, REQUIRED_QUALIFICATIONS, PREFERRED_QUALIFICATIONS
	}

	// Cheap first filter before the word-by-word heading check.
	private static final int HEADING_MAX_LENGTH = 60;

	private static final Pattern WORD_SPLIT = Pattern.compile("[^a-zA-Z]+");

	// A plain hyphen, or "&bull;" already decoded to "•" by Jsoup's .text().
	private static final Pattern BULLET_PREFIX = Pattern.compile("^[-•]\\s*");

	private JobDescriptionParser() {
	}

	public static JobRequirements parse(String rawHtml) {
		List<String> responsibilities = new ArrayList<String>();
		List<String> requiredQualifications = new ArrayList<String>();
		List<String> requiredSkills = new ArrayList<String>();
		List<String> preferredQualifications = new ArrayList<String>();
		List<String> preferredSkills = new ArrayList<String>();

		if (rawHtml != null && !rawHtml.trim().isEmpty()) {
			Document doc = Jsoup.parseBodyFragment(rawHtml);
			Bucket current = Bucket.RESPONSIBILITIES;

			for (Element el : doc.body().children()) {
				String tag = el.tagName();

				if ("ul".equalsIgnoreCase(tag) || "ol".equalsIgnoreCase(tag)) {
					for (Element li : el.select("> li")) {
						current = handleListItem(li, current, responsibilities, requiredQualifications,
								requiredSkills, preferredQualifications, preferredSkills);
					}
					continue;
				}

				String text = el.text().trim();
				if (text.isEmpty()) {
					continue;
				}

				Bucket detected = detectHeading(text);
				if (detected != null) {
					current = detected;
					continue;
				}

				String bullet = stripBulletPrefix(text);
				if (!bullet.isEmpty()) {
					addTo(current, bullet, responsibilities, requiredQualifications, preferredQualifications);
				}
			}
		}

		JobRequirements result = new JobRequirements();
		result.setResponsibilities(responsibilities);
		result.setRequiredQualifications(requiredQualifications);
		result.setRequiredSkills(requiredSkills);
		result.setPreferredQualifications(preferredQualifications);
		result.setPreferredSkills(preferredSkills);
		return result;
	}

	// True when no section heading was ever recognized - result shouldn't be trusted without a human rewrite.
	public static boolean isLowConfidence(JobRequirements requirements) {
		return requirements.getRequiredQualifications().isEmpty() && requirements.getRequiredSkills().isEmpty()
				&& requirements.getPreferredQualifications().isEmpty()
				&& requirements.getPreferredSkills().isEmpty();
	}

	// A nested <ul>/<ol> inside a <li> is the "Knowledge of X with:" shape - its items are the real content.
	private static Bucket handleListItem(Element li, Bucket current, List<String> responsibilities,
			List<String> requiredQualifications, List<String> requiredSkills,
			List<String> preferredQualifications, List<String> preferredSkills) {
		Element nestedList = li.selectFirst("ul, ol");
		if (nestedList != null) {
			List<String> target = current == Bucket.PREFERRED_QUALIFICATIONS ? preferredSkills : requiredSkills;
			for (Element nestedLi : nestedList.select("> li")) {
				String nestedText = nestedLi.text().trim();
				if (!nestedText.isEmpty()) {
					target.add(nestedText);
				}
			}
			return current;
		}

		String text = li.text().trim();
		if (text.isEmpty()) {
			return current;
		}

		Bucket detected = detectHeading(text);
		if (detected != null) {
			return detected;
		}

		addTo(current, stripBulletPrefix(text), responsibilities, requiredQualifications, preferredQualifications);
		return current;
	}

	private static Bucket detectHeading(String text) {
		if (text.isEmpty() || text.length() > HEADING_MAX_LENGTH || BULLET_PREFIX.matcher(text).find()) {
			return null;
		}
		boolean responsibilities = false;
		boolean qualifications = false;
		boolean preferred = false;
		for (String word : WORD_SPLIT.split(text.toLowerCase())) {
			if (word.isEmpty() || "optional".equals(word) || "required".equals(word)) {
				continue;
			}
			if (word.startsWith("responsibilit")) {
				responsibilities = true;
			} else if (word.startsWith("qualification")) {
				qualifications = true;
			} else if ("preferred".equals(word)) {
				preferred = true;
			} else {
				// Any other real word means this is content, not a heading label.
				return null;
			}
		}
		if (preferred && qualifications) {
			return Bucket.PREFERRED_QUALIFICATIONS;
		}
		if (responsibilities) {
			return Bucket.RESPONSIBILITIES;
		}
		if (qualifications) {
			return Bucket.REQUIRED_QUALIFICATIONS;
		}
		return null;
	}

	private static String stripBulletPrefix(String text) {
		return BULLET_PREFIX.matcher(text).replaceFirst("").trim();
	}

	private static void addTo(Bucket bucket, String text, List<String> responsibilities,
			List<String> requiredQualifications, List<String> preferredQualifications) {
		if (text.isEmpty()) {
			return;
		}
		switch (bucket) {
		case PREFERRED_QUALIFICATIONS:
			preferredQualifications.add(text);
			break;
		case REQUIRED_QUALIFICATIONS:
			requiredQualifications.add(text);
			break;
		case RESPONSIBILITIES:
		default:
			responsibilities.add(text);
			break;
		}
	}
}
