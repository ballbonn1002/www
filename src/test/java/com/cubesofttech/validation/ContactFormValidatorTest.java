package com.cubesofttech.validation;

import org.testng.Assert;
import org.testng.annotations.Test;

/**
 * TestNG, not JUnit - the project already ships testng-6.10.jar (and
 * mockito/powermock's TestNG modules) in WEB-INF/lib, unused until now;
 * there is no JUnit jar anywhere in the project, so this reuses what's
 * already on the classpath instead of adding a new test framework.
 */
public class ContactFormValidatorTest {

	// ---- First name / Last name ----

	@Test
	public void firstName_rejectsEmpty() {
		ValidationResult result = ContactFormValidator.validateFirstName("");
		Assert.assertFalse(result.isValid());
		Assert.assertEquals(result.getErrorMessage(), "Please enter your first name");
	}

	@Test
	public void firstName_rejectsNull() {
		Assert.assertFalse(ContactFormValidator.validateFirstName(null).isValid());
	}

	@Test
	public void firstName_rejectsWhitespaceOnly() {
		// Trim happens before the required check, so " " must not sneak
		// through as "non-empty".
		Assert.assertFalse(ContactFormValidator.validateFirstName("   ").isValid());
	}

	@Test
	public void lastName_rejectsEmpty() {
		ValidationResult result = ContactFormValidator.validateLastName("");
		Assert.assertFalse(result.isValid());
		Assert.assertEquals(result.getErrorMessage(), "Please enter your last name");
	}

	@Test
	public void firstNameAndLastName_haveDistinctRequiredMessages() {
		Assert.assertNotEquals(ContactFormValidator.validateFirstName("").getErrorMessage(),
				ContactFormValidator.validateLastName("").getErrorMessage());
	}

	@Test
	public void name_acceptsPlainEnglish() {
		Assert.assertTrue(ContactFormValidator.validateLastName("Smith").isValid());
	}

	@Test
	public void name_acceptsThai() {
		Assert.assertTrue(ContactFormValidator.validateFirstName("ณัฐชัย").isValid());
	}

	@Test
	public void name_acceptsThaiWithSpace_multiWordName() {
		Assert.assertTrue(ContactFormValidator.validateFirstName("ณัฐ ชัย").isValid());
	}

	@Test
	public void name_acceptsHyphenatedCompoundSurname() {
		Assert.assertTrue(ContactFormValidator.validateLastName("Smith-Jones").isValid());
	}

	@Test
	public void name_rejectsDigits() {
		ValidationResult result = ContactFormValidator.validateFirstName("John123");
		Assert.assertFalse(result.isValid());
		Assert.assertEquals(result.getErrorMessage(), "Please enter letters only, not numbers or symbols");
	}

	@Test
	public void name_rejectsSpecialSymbols() {
		Assert.assertFalse(ContactFormValidator.validateFirstName("John@").isValid());
	}

	@Test
	public void name_rejectsThaiDigits() {
		// ๑ is a Thai numeral, not a letter - must be rejected same as "1".
		Assert.assertFalse(ContactFormValidator.validateFirstName("นาม๑").isValid());
	}

	@Test
	public void name_trimsSurroundingWhitespaceInStoredValue() {
		Assert.assertEquals(ContactFormValidator.validateFirstName("  John  ").getValue(), "John");
	}

	@Test
	public void name_acceptsExactly50Characters() {
		Assert.assertTrue(ContactFormValidator.validateFirstName(repeat('a', 50)).isValid());
	}

	@Test
	public void name_rejectsOver50Characters() {
		Assert.assertFalse(ContactFormValidator.validateFirstName(repeat('a', 51)).isValid());
	}

	// ---- Email ----

	@Test
	public void email_rejectsEmpty() {
		ValidationResult result = ContactFormValidator.validateEmail("");
		Assert.assertFalse(result.isValid());
		Assert.assertEquals(result.getErrorMessage(), "Please enter your email");
	}

	@Test
	public void email_acceptsStandardFormat() {
		Assert.assertTrue(ContactFormValidator.validateEmail("name@example.com").isValid());
	}

	@Test
	public void email_acceptsSubdomainAndPlusTag() {
		Assert.assertTrue(ContactFormValidator.validateEmail("a.b+c@sub.example.co.th").isValid());
	}

	@Test
	public void email_rejectsMissingAtSign() {
		ValidationResult result = ContactFormValidator.validateEmail("nameexample.com");
		Assert.assertFalse(result.isValid());
		Assert.assertEquals(result.getErrorMessage(), "Invalid email - please check and try again (e.g. name@example.com)");
	}

	@Test
	public void email_rejectsMissingTld() {
		Assert.assertFalse(ContactFormValidator.validateEmail("name@example").isValid());
	}

	@Test
	public void email_rejectsMissingDomain() {
		Assert.assertFalse(ContactFormValidator.validateEmail("name@.com").isValid());
	}

	@Test
	public void email_rejectsInternalSpace() {
		Assert.assertFalse(ContactFormValidator.validateEmail("na me@example.com").isValid());
	}

	@Test
	public void email_rejectsOver254Characters() {
		String tooLong = repeat('a', 250) + "@example.com";
		Assert.assertFalse(ContactFormValidator.validateEmail(tooLong).isValid());
	}

	@Test
	public void email_trimsSurroundingWhitespace() {
		Assert.assertTrue(ContactFormValidator.validateEmail("  name@example.com  ").isValid());
	}

	// ---- Phone ----

	@Test
	public void phone_rejectsEmpty() {
		ValidationResult result = ContactFormValidator.validatePhone("");
		Assert.assertFalse(result.isValid());
		Assert.assertEquals(result.getErrorMessage(), "Please enter your phone number");
	}

	@Test
	public void phone_acceptsTenDigitMobileStartingWithZero() {
		Assert.assertTrue(ContactFormValidator.validatePhone("0812345678").isValid());
	}

	@Test
	public void phone_acceptsNineDigitLandlineStartingWithZero() {
		Assert.assertTrue(ContactFormValidator.validatePhone("021234567").isValid());
	}

	@Test
	public void phone_acceptsPlus66Form() {
		Assert.assertTrue(ContactFormValidator.validatePhone("+66812345678").isValid());
	}

	@Test
	public void phone_stripsHyphenSeparatorsAndNormalizes() {
		Assert.assertEquals(ContactFormValidator.validatePhone("081-234-5678").getValue(), "0812345678");
	}

	@Test
	public void phone_stripsSpaceSeparatorsAndNormalizes() {
		Assert.assertEquals(ContactFormValidator.validatePhone("081 234 5678").getValue(), "0812345678");
	}

	@Test
	public void phone_normalizesPlus66ToDomesticZeroPrefixForm() {
		// Same stored shape regardless of which form the visitor typed.
		Assert.assertEquals(ContactFormValidator.validatePhone("+66812345678").getValue(), "0812345678");
	}

	@Test
	public void phone_rejectsLetters() {
		ValidationResult result = ContactFormValidator.validatePhone("081abc5678");
		Assert.assertFalse(result.isValid());
		Assert.assertEquals(result.getErrorMessage(), "Invalid phone number - please enter 9-10 digits only");
	}

	@Test
	public void phone_rejectsPlusSignNotAtStart() {
		Assert.assertFalse(ContactFormValidator.validatePhone("081+2345678").isValid());
	}

	@Test
	public void phone_rejectsTooFewDigits() {
		Assert.assertFalse(ContactFormValidator.validatePhone("08123").isValid());
	}

	@Test
	public void phone_rejectsTooManyDigits() {
		Assert.assertFalse(ContactFormValidator.validatePhone("081234567890").isValid());
	}

	@Test
	public void phone_rejectsMissingZeroOrPlus66Prefix() {
		Assert.assertFalse(ContactFormValidator.validatePhone("812345678").isValid());
	}

	private static String repeat(char c, int count) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < count; i++) {
			sb.append(c);
		}
		return sb.toString();
	}
}
