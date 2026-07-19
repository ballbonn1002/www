package com.cubesofttech.validation;

import java.util.regex.Pattern;

/**
 * Field-by-field validation for the site's contact form (see
 * ContactsAction) - kept separate from the Action, one method per field, so
 * any other form on the site that needs the same name/email/phone rules can
 * call these directly instead of duplicating the regex/logic. Mirrored in
 * JS in contacts.jsp for real-time (blur) feedback - this class is the
 * authoritative copy; the client-side version exists only for UX, not as a
 * security boundary.
 */
public final class ContactFormValidator {

	// Thai consonants/vowels/tone marks (U+0E01-U+0E4F) - deliberately
	// stops short of the Thai digits ๐-๙ (U+0E50-U+0E59), which sit
	// immediately after in the same Unicode block, so a Thai numeral is
	// rejected the same as an Arabic one. This range also lets through a
	// couple of non-letter symbols from that block (e.g. ฿, the baht
	// sign) that happen to fall inside it - accepted as a rare, harmless
	// edge case rather than splitting the range further for it.
	private static final Pattern NAME_PATTERN = Pattern.compile("^[ก-๏a-zA-Z\\s-]+$");
	private static final int NAME_MAX_LENGTH = 50;

	// Deliberately a simple local-part@domain.tld shape, not a full RFC
	// 5322 implementation - a contact form doesn't need to accept every
	// edge case the spec technically allows.
	private static final Pattern EMAIL_PATTERN = Pattern
			.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
	private static final int EMAIL_MAX_LENGTH = 254;

	// What the visitor is allowed to type: digits, spaces/hyphens as group
	// separators, and an optional leading "+" (for +66). Checked before
	// separators are stripped, so a stray letter or a "+" anywhere but the
	// start is rejected outright instead of silently stripped away.
	private static final Pattern PHONE_ALLOWED_CHARS = Pattern.compile("^\\+?[0-9\\s-]+$");
	// Domestic form: a leading 0 plus 8-9 more digits (9-10 digits total),
	// covering both landline (e.g. 021234567) and mobile (0812345678).
	private static final Pattern PHONE_LOCAL = Pattern.compile("^0[0-9]{8,9}$");
	// +66 form drops the leading 0, so it's +66 plus that same 8-9 digits.
	private static final Pattern PHONE_INTL = Pattern.compile("^\\+66[0-9]{8,9}$");

	private ContactFormValidator() {
	}

	public static ValidationResult validateFirstName(String value) {
		return validateName(value, "กรุณากรอกชื่อ");
	}

	public static ValidationResult validateLastName(String value) {
		return validateName(value, "กรุณากรอกนามสกุล");
	}

	private static ValidationResult validateName(String value, String requiredMessage) {
		String trimmed = value == null ? "" : value.trim();
		if (trimmed.isEmpty()) {
			return ValidationResult.invalid(requiredMessage);
		}
		// Length and character-set failures share one message - the spec
		// only calls for two distinct messages per field (empty vs.
		// malformed), so an over-length name is just another flavor of
		// "not a well-formed name".
		if (trimmed.length() > NAME_MAX_LENGTH || !NAME_PATTERN.matcher(trimmed).matches()) {
			return ValidationResult.invalid("กรุณากรอกเฉพาะตัวอักษร ไม่ใช่ตัวเลขหรือสัญลักษณ์");
		}
		return ValidationResult.valid(trimmed);
	}

	public static ValidationResult validateEmail(String value) {
		String trimmed = value == null ? "" : value.trim();
		if (trimmed.isEmpty()) {
			return ValidationResult.invalid("กรุณากรอกอีเมล");
		}
		if (trimmed.length() > EMAIL_MAX_LENGTH || !EMAIL_PATTERN.matcher(trimmed).matches()) {
			return ValidationResult.invalid("อีเมลไม่ถูกต้อง กรุณาตรวจสอบอีกครั้ง (เช่น name@example.com)");
		}
		return ValidationResult.valid(trimmed);
	}

	public static ValidationResult validatePhone(String value) {
		String trimmed = value == null ? "" : value.trim();
		if (trimmed.isEmpty()) {
			return ValidationResult.invalid("กรุณากรอกเบอร์โทรศัพท์");
		}
		if (!PHONE_ALLOWED_CHARS.matcher(trimmed).matches()) {
			return ValidationResult.invalid("เบอร์โทรศัพท์ไม่ถูกต้อง กรุณากรอกเฉพาะตัวเลข 9-10 หลัก");
		}

		String stripped = trimmed.replaceAll("[\\s-]", "");
		if (PHONE_LOCAL.matcher(stripped).matches()) {
			return ValidationResult.valid(stripped);
		}
		if (PHONE_INTL.matcher(stripped).matches()) {
			// Normalized to the same domestic 0-prefixed shape either way,
			// so the stored/emailed value is consistent regardless of
			// which form the visitor typed.
			return ValidationResult.valid("0" + stripped.substring(3));
		}
		return ValidationResult.invalid("เบอร์โทรศัพท์ไม่ถูกต้อง กรุณากรอกเฉพาะตัวเลข 9-10 หลัก");
	}
}
