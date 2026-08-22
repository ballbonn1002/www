package com.cubesofttech.validation;

/**
 * Outcome of a single field validation: either the trimmed/normalized value
 * ready to use, or a user-facing Thai error message - never both. Kept
 * generic (not contact-form-specific) so any validator in this package can
 * return it the same way.
 */
public final class ValidationResult {

	private final boolean valid;
	private final String value;
	private final String errorMessage;

	private ValidationResult(boolean valid, String value, String errorMessage) {
		this.valid = valid;
		this.value = value;
		this.errorMessage = errorMessage;
	}

	public static ValidationResult valid(String normalizedValue) {
		return new ValidationResult(true, normalizedValue, null);
	}

	public static ValidationResult invalid(String errorMessage) {
		return new ValidationResult(false, null, errorMessage);
	}

	public boolean isValid() {
		return valid;
	}

	/**
	 * Trimmed/normalized value - only meaningful when {@link #isValid()}.
	 */
	public String getValue() {
		return value;
	}

	/**
	 * User-facing Thai error message - only meaningful when not
	 * {@link #isValid()}.
	 */
	public String getErrorMessage() {
		return errorMessage;
	}
}
