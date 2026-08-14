<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="comp"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="language" content="en-th">

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Cube SoftTech.Co., Ltd.",
  "image": "",
  "@id": "${constant.webPath}",
  "url": "",
  "telephone": "02-679-8855, 02-634-4449, 088-022-9400",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "160/170-2, 12A Fl., ITF Silom Palace Building Silom Rd., Suriyawong, Bangrak",
    "addressLocality": "Bangkok",
    "postalCode": "10500",
    "addressCountry": "TH"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 13.7276547,
    "longitude": 100.5281612
  } ,
  "sameAs": "www.facebook.com/CubeSoftTech"
}
</script>

<style type="text/css">
.parallax {
	min-height: 500px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

/* Scoped to .contactbg - pageHeader.tag is shared with blog.jsp. */
.contactbg .page-title {
	color: #fff;
}

.contactbg .breadcrumb {
	color: #fff;
}

/* header.jsp's inline nav-link color assumes a light hero; override while
   glassy over this dark photo (desktop only - below the collapse breakpoint
   the frame is a light dropdown panel, same as every other page). */
@media (min-width: 992px) {
	nav.navbar.fixed-top:not(.is-scrolled) .navbar-menu-frame .nav-link:not(.active) {
		color: #fff !important;
	}
}

.contact-heading {
	color: var(--brand-red);
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 1.25rem;
}

/* Honeypot - off-screen, not display:none, since some bots skip fields
   that are literally hidden but still fill ones that are merely positioned
   off-screen. Real users never tab into or see this. */
.contact-hp {
	position: absolute;
	left: -9999px;
	top: -9999px;
	height: 0;
	overflow: hidden;
}

.contact-column {
	display: flex;
}

/* AOS's resting transform clips backdrop-filter's view behind it. */
.contact-columns-row.aos-animate {
	transform: none;
}

/* A blurred panel is nearly invisible at low opacity, which read as
   the glass "popping in" late during the fade - so skip the fade. */
.contact-columns-row[data-aos] {
	opacity: 1;
}

/* Flush halves, rounded/clipped as one shape, not two cards. */
.contact-columns-row {
	margin-left: 0;
	margin-right: 0;
	gap: 0;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 24px 60px -20px rgba(0, 0, 0, 0.4);
}

.contact-columns-row > .contact-column {
	padding-left: 0;
	padding-right: 0;
}

@media (min-width: 992px) {
	.contact-columns-row > .contact-column {
		flex: 0 0 50%;
		max-width: 50%;
	}
}

/* Top-aligned so both halves' headings land on the same line. */
.contact-box {
	flex: 1;
	position: relative;
	padding: 40px;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

/* Translucent tint over .contactbg's shared photo, not its own image. */
.contact-info-group {
	background-color: rgba(14, 16, 20, 0.45);
	backdrop-filter: blur(20px);
	-webkit-backdrop-filter: blur(20px);
	color: #fff;
}

/* Same photo+scrim language as the home services section. */
.contactbg {
	background: linear-gradient(180deg, rgba(20, 22, 26, 0.72) 0%,
		rgba(20, 22, 26, 0.55) 100%),
		url("/pages-front/img/contact/team-desk-bg.jpg") center/cover fixed
		no-repeat;
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-bottom: 5%;
	padding-left: 10%;
	padding-right: 10%;
}

/* background-attachment:fixed with this multi-layer background is unreliable
   on mobile Safari/some Android WebViews (scrim can fail to composite) -
   parallax is a desktop nicety anyway, fall back to scroll below. */
@media screen and (max-width: 870px) {
	.contactbg {
		background-attachment: scroll;
		padding-left: 5%;
		padding-right: 5%;
	}
	/* 10% page padding + 40px box padding left icon+input fields only ~220px
	   wide on phones - too tight for the 46px icon plus a floating label. */
	.contact-box {
		padding: 24px;
	}
}

.contact-info-group .contact-heading {
	color: #fff;
	/* Subheading below carries the 1.25rem gap down to the rows instead. */
	margin-bottom: 0.35rem;
}

.contact-subheading {
	margin: 0 0 1.25rem;
	font-size: 14px;
	color: rgba(255, 255, 255, 0.7);
}

.contact-info-group a {
	color: #fff;
	text-decoration: underline;
}

.contact-info-row {
	gap: 1rem;
	margin-bottom: 1.5rem;
}

.contact-info-row:last-child {
	margin-bottom: 0;
}

.contact-info-row span:not(.contact-info-row__icon) {
	font-size: 17px;
}

/* Glassy chip, matching the panel, instead of a solid white sticker. */
.contact-info-row__icon {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 44px;
	height: 44px;
	border-radius: 50%;
	background-color: rgba(255, 255, 255, 0.15);
	border: 1px solid rgba(255, 255, 255, 0.3);
	flex-shrink: 0;
}

.contact-info-row__icon i {
	font-size: 20px;
	color: #fff;
	margin-right: 0 !important;
}

.contact-toast {
	position: fixed;
	top: 24px;
	left: 50%;
	z-index: 2000;
	display: flex;
	align-items: center;
	gap: 10px;
	max-width: min(90vw, 420px);
	padding: 14px 20px;
	border-radius: 12px;
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.06);
	box-shadow: 0 12px 32px rgba(0, 0, 0, 0.16);
	color: #1C1B1A;
	font-size: 14.5px;
	font-weight: 500;
	opacity: 0;
	pointer-events: none;
	transform: translate(-50%, -12px);
	transition: opacity 0.3s ease, transform 0.3s ease;
}

.contact-toast.is-visible {
	opacity: 1;
	transform: translate(-50%, 0);
}

.contact-toast i {
	color: #2F6F5E;
	font-size: 20px;
	flex-shrink: 0;
}

.contact-toast--error i {
	color: var(--brand-red);
}

@media (prefers-reduced-motion: reduce) {
	.contact-toast {
		transition: opacity 0.15s linear;
		transform: translate(-50%, 0);
	}
}

/* Light glass card, mirrors .home-services__card's ramp. */
.contact-form-box {
	background: linear-gradient(180deg, rgba(255, 255, 255, 0.8) 0%,
		rgba(255, 255, 255, 0.92) 100%);
	backdrop-filter: blur(28px) saturate(1.4);
	-webkit-backdrop-filter: blur(28px) saturate(1.4);
}

/* Translucent enough to read as glass, dense enough to stay legible. */
.contact-form-box .form-control {
	border-radius: 10px;
	background-color: rgba(255, 255, 255, 0.55);
}

.contact-form-box .form-control:focus {
	background-color: rgba(255, 255, 255, 0.85);
}

.contact-form-box .input-group .form-control {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

.contact-form-box .input-group-prepend {
	align-self: flex-start;
}

.contact-form-box .input-group-text {
	height: calc(3.1rem + 2px);
	background-color: rgba(255, 255, 255, 0.55);
	border-right: 0;
	color: var(--brand-red);
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

/* Recreates BS5's form-floating - BS4 has no built-in equivalent. */
.contact-form-box .field-floating {
	position: relative;
}

.contact-form-box .field-floating > .form-control {
	height: calc(3.1rem + 2px);
	padding: 1.4rem 0.75rem 0.4rem;
}

.contact-form-box .field-floating > textarea.form-control {
	height: auto;
	padding-top: 1.5rem;
}

.contact-form-box .field-floating > label {
	position: absolute;
	top: 0;
	left: 0.75rem;
	margin: 0;
	padding: 0.85rem 0 0;
	color: #6c757d;
	pointer-events: none;
	transform-origin: 0 0;
	transition: transform 0.15s ease-in-out, color 0.15s ease-in-out;
}

.contact-form-box .field-floating > .form-control::placeholder {
	color: transparent;
}

.contact-form-box .field-floating > .form-control:focus ~ label,
.contact-form-box .field-floating > .form-control:not(:placeholder-shown) ~ label
	{
	transform: scale(0.82) translateY(-0.7rem);
	color: var(--brand-red);
}

.contact-form-box .input-group .field-floating {
	flex: 1 1 auto;
}

.contact-form-box .input-group .field-floating>.form-control {
	width: 100%;
}

.required-mark {
	color: var(--brand-red);
}

.optional-mark {
	font-size: 12px;
	font-weight: 400;
	color: #8a8f98;
}

#sendEmail {
	border-radius: 10px;
	width: 100%;
	border: 0;
	background-color: var(--brand-red);
	font-weight: 600;
}

#sendEmail:hover {
	background-color: var(--brand-red-dark);
}
</style>

<div class="parallax">
	<div class="contactbg">
		<comp:pageHeader label="Contacts" />

		<div class="contact-toast" id="contactSuccessToast" role="status" aria-live="polite">
			<i class="bi bi-check-circle-fill"></i>
			<span>Your message has been sent - we'll get back to you soon.</span>
		</div>

		<div class="contact-toast contact-toast--error" id="contactErrorToast" role="alert" aria-live="assertive">
			<i class="bi bi-exclamation-circle-fill"></i>
			<span>${not empty captchaError ? captchaError : formError}</span>
		</div>

		<form id="contactForm" action="sendEmailContact" method="post">
			<div class="contact-hp" aria-hidden="true">
				<label for="contactHp">Leave this field empty</label>
				<input type="text" name="hpToken" id="contactHp" tabindex="-1"
					autocomplete="off">
			</div>
			<div class="row contact-columns-row" data-aos="fade-up"
				data-aos-duration="800">
				<div class="col-12 col-lg-6 contact-column">
					<div class="contact-box contact-info-group">
						<h2 class="contact-heading">Cube SoftTech Co.,Ltd.</h2>
						<p class="contact-subheading">We usually respond within 1
							business day.</p>

						<div class="contact-info-row d-flex align-items-center">
							<span class="contact-info-row__icon"><i
								class="bi bi-clock"></i></span> <span>Mon - Fri, 9.00-18.00</span>
						</div>

						<div class="contact-info-row d-flex align-items-center">
							<span class="contact-info-row__icon"><i
								class="bi bi-telephone"></i></span> <span> <a
								href="tel:026798855">02 679 8855</a><br> <a
								href="tel:0880229400">088 022 9400</a>
							</span>
						</div>

						<div class="contact-info-row d-flex align-items-center">
							<span class="contact-info-row__icon"><i
								class="bi bi-envelope"></i></span> <span> <a
								href="/cdn-cgi/l/email-protection" class="__cf_email__"
								data-cfemail="e68f888089a685938483958980929283858ec885898b">info@cubesofttech.com</a>
							</span>
						</div>

						<div class="contact-info-row d-flex align-items-center">
							<span class="contact-info-row__icon"><i
								class="bi bi-geo-alt"></i></span> <span>160/170-2, 12A Fl., ITF
								Silom Palace Building Silom Rd., Suriyawong, Bangrak Bangrak,
								Bangkok 10500 Thailand</span>
						</div>

					</div>
				</div>

				<div class="col-12 col-lg-6 contact-column">
				<div class="contact-box contact-form-box">
					<h2 class="contact-heading">Get in touch</h2>

					<div class="form-row">
						<div class="form-group col-md-6 field-floating">
							<input type="text"
								class="form-control ${not empty firstNameError ? 'is-invalid' : ''}"
								placeholder=" " name="firstName" id="firstName"
								value="${firstName}">
							<label for="firstName">First name <span
								class="required-mark">*</span></label>
							<div class="invalid-feedback">${firstNameError}</div>
						</div>
						<div class="form-group col-md-6 field-floating">
							<input type="text"
								class="form-control ${not empty lastNameError ? 'is-invalid' : ''}"
								placeholder=" " name="lastName" id="lastName"
								value="${lastName}">
							<label for="lastName">Last name <span
								class="required-mark">*</span></label>
							<div class="invalid-feedback">${lastNameError}</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="bi bi-envelope"></i></span>
							</div>
							<div class="field-floating">
								<input type="email"
									class="form-control is-required ${not empty emailError ? 'is-invalid' : ''}"
									placeholder=" " name="contactEmail" id="contactEmail"
									value="${contactEmail}">
								<label for="contactEmail">E-Mail <span
									class="required-mark">*</span></label>
								<div class="invalid-feedback">${emailError}</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="bi bi-telephone"></i></span>
							</div>
							<div class="field-floating">
								<input type="tel"
									class="form-control ${not empty phoneError ? 'is-invalid' : ''}"
									placeholder=" " name="contactTel" id="contactTel"
									value="${contactTel}">
								<label for="contactTel">Telephone <span
									class="required-mark">*</span></label>
								<div class="invalid-feedback">${phoneError}</div>
							</div>
						</div>
					</div>

					<div class="form-group field-floating">
						<textarea class="form-control" rows="3" placeholder=" "
							name="contactMessage" id="contactMessage">${contactMessage}</textarea>
						<label for="contactMessage">Message <span class="optional-mark">(optional)</span></label>
					</div>

					<div class="form-group">
						<div class="g-recaptcha" data-sitekey="${constant.recaptchaSiteKey}"
							data-callback="clearContactCaptchaError"></div>
						<div class="text-danger small mt-2" id="captchaError">${captchaError}</div>
					</div>
					<div class="form-group text-right">
						<button type="button" class="btn btn-danger" id="sendEmail">Send</button>
					</div>
				</div>
			</div>
			</div>
		</form>
	</div>

</div>
<div style="overflow: hidden;">
	<iframe
		src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.858308665869!2d100.52603131477895!3d13.727026990363473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30e29f258dd25adf%3A0x7ebb9335dc44b9d2!2sCube%20SoftTech%20Co.%2C%20Ltd.!5e0!3m2!1sth!2sth!4v1567563105166!5m2!1sth!2sth"
		width="100%" height="450" frameborder="0" style="border: 0;"
		allowfullscreen=""></iframe>
</div>

<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<script type="text/javascript">
	var NAME_PATTERN = /^[ก-๏a-zA-Z\s-]+$/;
	var NAME_MAX_LENGTH = 50;
	var EMAIL_PATTERN = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
	var EMAIL_MAX_LENGTH = 254;
	var PHONE_ALLOWED_CHARS = /^\+?[0-9\s-]+$/;
	var PHONE_NUMBER = /^\+?[0-9]{7,15}$/;

	var formSubmitAttempted = false;

	// reCAPTCHA's data-callback - fires the instant the checkbox is solved,
	// so the leftover "Please confirm..." text doesn't sit there looking
	// unresolved until the next full-page submit/reload clears it.
	function clearContactCaptchaError() {
		$('#captchaError').text('');
	}

	function validateNameValue(value, requiredMessage, allowRequired) {
		var trimmed = (value || '').trim();
		if (!trimmed) {
			return allowRequired ? requiredMessage : null;
		}
		if (trimmed.length > NAME_MAX_LENGTH || !NAME_PATTERN.test(trimmed)) {
			return 'Please enter letters only, not numbers or symbols';
		}
		return null;
	}

	function validateEmailValue(value, allowRequired) {
		var trimmed = (value || '').trim();
		if (!trimmed) {
			return allowRequired ? 'Please enter your email' : null;
		}
		if (trimmed.length > EMAIL_MAX_LENGTH || !EMAIL_PATTERN.test(trimmed)) {
			return 'Invalid email - please check and try again (e.g. name@example.com)';
		}
		return null;
	}

	function validatePhoneValue(value, allowRequired) {
		var trimmed = (value || '').trim();
		if (!trimmed) {
			return allowRequired ? 'Please enter your phone number' : null;
		}
		if (!PHONE_ALLOWED_CHARS.test(trimmed)) {
			return 'Invalid phone number - please enter digits only';
		}
		var stripped = trimmed.replace(/[\s-]/g, '');
		if (!PHONE_NUMBER.test(stripped)) {
			return 'Invalid phone number - please enter digits only';
		}
		return null;
	}
	function applyFieldValidation($input, errorMessage) {
		var $feedback = $input.siblings('.invalid-feedback');
		if (errorMessage) {
			$input.addClass('is-invalid');
			$feedback.text(errorMessage);
		} else {
			$input.removeClass('is-invalid');
			$feedback.text('');
		}
		return !errorMessage;
	}

	function validateField(fieldId) {
		var $input = $('#' + fieldId);
		var value = $input.val();
		var allowRequired = formSubmitAttempted;
		var errorMessage;
		if (fieldId === 'firstName') {
			errorMessage = validateNameValue(value,
					'Please enter your first name', allowRequired);
		} else if (fieldId === 'lastName') {
			errorMessage = validateNameValue(value,
					'Please enter your last name', allowRequired);
		} else if (fieldId === 'contactEmail') {
			errorMessage = validateEmailValue(value, allowRequired);
		} else if (fieldId === 'contactTel') {
			errorMessage = validatePhoneValue(value, allowRequired);
		}
		return applyFieldValidation($input, errorMessage);
	}

	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						AOS.init();

						if (${not empty contactSuccess}) {
							var toast = document.getElementById('contactSuccessToast');
							toast.classList.add('is-visible');
							setTimeout(function() {
								toast.classList.remove('is-visible');
							}, 5000);
						}

						if (${not empty captchaError or not empty formError}) {
							var errorToast = document.getElementById('contactErrorToast');
							errorToast.classList.add('is-visible');
							setTimeout(function() {
								errorToast.classList.remove('is-visible');
							}, 5000);
						}

						$(document)
								.ready(
										function() {

											$(
													'#firstName, #lastName, #contactEmail, #contactTel')
													.on(
															'input',
															function() {
																if ($(this)
																		.hasClass(
																				'is-invalid')) {
																	validateField(this.id);
																}
															});

											$(
													'#firstName, #lastName, #contactEmail, #contactTel')
													.on('blur', function() {
														validateField(this.id);
													});

											// เมื่อกดปุ่ม "Send"
											$('#sendEmail')
													.click(
															function(e) {
																e
																		.preventDefault();

																formSubmitAttempted = true;

																var firstNameValid = validateField('firstName');
																var lastNameValid = validateField('lastName');
																var emailValid = validateField('contactEmail');
																var phoneValid = validateField('contactTel');
																if (!firstNameValid
																		|| !lastNameValid
																		|| !emailValid
																		|| !phoneValid) {
																	return;
																}

																// Final correctness is still checked server-side
																// (ContactsAction) regardless - this just avoids a
																// wasted round-trip when it's obviously unchecked.
																if (typeof grecaptcha !== 'undefined'
																		&& !grecaptcha.getResponse()) {
																	$('#captchaError')
																			.text(
																					"Please complete the verification above.");
																	return;
																}

																$('#contactForm').submit();
															});
										});
					});
</script>

<comp:scrollToTopButton />
