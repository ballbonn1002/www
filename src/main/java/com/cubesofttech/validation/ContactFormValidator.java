package com.cubesofttech.validation;

import java.util.regex.Pattern;

// Shared field validation; mirrored in JS for blur feedback, but this is the authoritative copy.
public final class ContactFormValidator {

	// Thai consonants/vowels/tone marks only - stops short of Thai digits ๐-๙.
	private static final Pattern NAME_PATTERN = Pattern.compile("^[ก-๏a-zA-Z\\s-]+$");
	private static final int NAME_MAX_LENGTH = 50;

	// Simple local-part@domain.tld shape, not a full RFC 5322 implementation.
	private static final Pattern EMAIL_PATTERN = Pattern
			.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
	private static final int EMAIL_MAX_LENGTH = 254;

	// Digits, spaces/hyphens as separators, optional leading "+".
	private static final Pattern PHONE_ALLOWED_CHARS = Pattern.compile("^\\+?[0-9\\s-]+$");
	// International shape (not Thai-only) for overseas contacts; 7-15 digits covers E.164.
	private static final Pattern PHONE_NUMBER = Pattern.compile("^\\+?[0-9]{7,15}$");

	private static final int MESSAGE_MAX_LENGTH = 2000;
	// Defense in depth on top of output-side escaping - rejects, doesn't strip.
	private static final Pattern MESSAGE_XSS_PATTERN = Pattern.compile(
			"<\\s*(script|iframe|object|embed)\\b|javascript\\s*:|\\bon\\w+\\s*=",
			Pattern.CASE_INSENSITIVE);

	private ContactFormValidator() {
	}

	private static String normalize(String value) {
		return value == null ? "" : value.trim();
	}

	public static ValidationResult validateFirstName(String value) {
		return validateName(value, "Please enter your first name");
	}

	public static ValidationResult validateLastName(String value) {
		return validateName(value, "Please enter your last name");
	}

	// For forms with a single combined name field instead of first/last split.
	public static ValidationResult validateName(String value) {
		return validateName(value, "Please enter your full name");
	}

	private static ValidationResult validateName(String value, String requiredMessage) {
		String trimmed = normalize(value);
		if (trimmed.isEmpty()) {
			return ValidationResult.invalid(requiredMessage);
		}
		// Length and character-set failures share one message.
		if (trimmed.length() > NAME_MAX_LENGTH || !NAME_PATTERN.matcher(trimmed).matches()) {
			return ValidationResult.invalid("Please enter letters only, not numbers or symbols");
		}
		return ValidationResult.valid(trimmed);
	}

	public static ValidationResult validateEmail(String value) {
		String trimmed = normalize(value);
		if (trimmed.isEmpty()) {
			return ValidationResult.invalid("Please enter your email");
		}
		if (trimmed.length() > EMAIL_MAX_LENGTH || !EMAIL_PATTERN.matcher(trimmed).matches()) {
			return ValidationResult.invalid("Invalid email - please check and try again (e.g. name@example.com)");
		}
		return ValidationResult.valid(trimmed);
	}

	public static ValidationResult validatePhone(String value) {
		String trimmed = normalize(value);
		if (trimmed.isEmpty()) {
			return ValidationResult.invalid("Please enter your phone number");
		}
		if (!PHONE_ALLOWED_CHARS.matcher(trimmed).matches()) {
			return ValidationResult.invalid("Invalid phone number - please enter digits only");
		}

		String stripped = trimmed.replaceAll("[\\s-]", "");
		if (PHONE_NUMBER.matcher(stripped).matches()) {
			return ValidationResult.valid(stripped);
		}
		return ValidationResult.invalid("Invalid phone number - please enter digits only");
	}

	// Message is optional, so an empty value is valid - unlike the required fields above.
	public static ValidationResult validateMessage(String value) {
		String trimmed = normalize(value);
		if (trimmed.isEmpty()) {
			return ValidationResult.valid(trimmed);
		}
		if (trimmed.length() > MESSAGE_MAX_LENGTH) {
			return ValidationResult.invalid("Message is too long - please keep it under " + MESSAGE_MAX_LENGTH
					+ " characters");
		}
		if (MESSAGE_XSS_PATTERN.matcher(trimmed).find()) {
			return ValidationResult.invalid("Message contains characters that aren't allowed - please remove any code or links");
		}
		return ValidationResult.valid(trimmed);
	}
}
