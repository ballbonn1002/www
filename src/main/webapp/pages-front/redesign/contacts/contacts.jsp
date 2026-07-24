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
	/* The image used */
	background-image: url("pages-front/img/contact/bg2.jpg");
	/* Set a specific height */
	min-height: 500px;
	/* Create the parallax scrolling effect */
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
}

.page-title {
	margin: 0;
	font-size: 16px;
	font-weight: 600;
}

.contact-heading {
	color: #BD2125;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 1.25rem;
}

.contact-column {
	display: flex;
}

.contact-columns-row {
	margin-left: 0;
	margin-right: 0;
	gap: 0.5rem;
}

.contact-columns-row > .contact-column {
	padding-left: 0;
	padding-right: 0;
}

@media (min-width: 992px) {
	.contact-columns-row > .contact-column {
		flex: 0 0 calc(50% - 0.25rem);
		max-width: calc(50% - 0.25rem);
	}
}

.contact-box {
	flex: 1;
	position: relative;
	border-radius: 16px;
	padding: 40px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.contact-info-group {
	background: url("pages-front/img/contact/team-desk-bg.jpg") center/cover
		no-repeat;
	color: #fff;
}

.contactbg {
	background-color: #F5F5F5;
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-bottom: 5%;
	padding-left: 10%;
	padding-right: 10%;
}

.contact-info-group::before {
	content: "";
	position: absolute;
	inset: 0;
	background-color: rgba(0, 0, 0, 0.72);
	border-radius: inherit;
}

.contact-info-group>* {
	position: relative;
}

.contact-info-group .contact-heading {
	color: #fff;
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

.contact-info-row__icon {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 44px;
	height: 44px;
	border-radius: 50%;
	background-color: #fff;
	flex-shrink: 0;
}

.contact-info-row__icon img {
	max-width: 22px;
	max-height: 22px;
	object-fit: contain;
}

.contact-info-row__icon i {
	font-size: 20px;
	color: #BD2125;
}

.contact-social-group {
	margin-top: 1.5rem;
}

.contact-social-links {
	display: flex;
	gap: 0.75rem;
}

.contact-social-links__item {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 44px;
	height: 44px;
	border-radius: 50%;
	background-color: #fff;
	color: #BD2125;
	font-size: 18px;
	transition: background-color 0.2s ease, color 0.2s ease;
}

.contact-social-links__item:hover {
	background-color: #BD2125;
	color: #fff;
}

.contact-form-box {
	background-color: #fff;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

.contact-form-box .form-control {
	border-radius: 10px;
}

.contact-form-box .input-group .form-control {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

.contact-form-box .input-group-text {
	background-color: #fff;
	border-right: 0;
	color: #BD2125;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

#sendEmail {
	border-radius: 10px;
	width: 100%;
}

.btn-info {
	background-color: #000;
	border-color: transparent;
	color: #fff;
}

.btn-info:hover, .btn-info:focus, .btn-info:active {
	background-color: #222;
	border-color: transparent;
	color: #fff;
}

.captcha {
	background-color: #eef2f7;
	font-size: 20px;
	font-weight: bold;
	letter-spacing: 3px;
	padding: 10px 20px;
	flex-grow: 1;
	text-align: center;
	user-select: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.message {
	margin-top: 15px;
	/*font-size: 16px;*/
	font-weight: bold;
}

.message.green {
	color: #28a745;
}

.message.red {
	color: #dc3545;
}
</style>

<div class="parallax show-on-srcoll">
	<div class="contactbg">
		<comp:pageHeader label="Contacts" />

		<form id="contactForm" action="sendEmailContact" method="post">
			<div class="row contact-columns-row">
				<div class="col-12 col-lg-6 contact-column" data-aos="zoom-in"
					data-aos-duration="800">
					<div class="contact-box contact-info-group">
						<h2 class="contact-heading">Cube SoftTech Co.,Ltd.</h2>

						<div class="contact-info-row d-flex align-items-center">
							<span class="contact-info-row__icon"><i
								class="bi bi-clock"></i></span> <span>Mon - Fri, 9.00-18.00</span>
						</div>

						<div class="contact-info-row d-flex align-items-center">
							<span class="contact-info-row__icon"> <img
								src="pages-front/img/contact/icon09.png" width="50" height="50"
								alt="">
							</span> <span> <a href="tel:026798855">02 679 8855</a><br> <a
								href="tel:0880229400">088 022 9400</a>
							</span>
						</div>

						<div class="contact-info-row d-flex align-items-center">
							<span class="contact-info-row__icon"> <img
								src="pages-front/img/contact/icon07.png" width="40" height="40"
								alt="">
							</span> <span> <a href="/cdn-cgi/l/email-protection"
								class="__cf_email__"
								data-cfemail="e68f888089a685938483958980929283858ec885898b">info@cubesofttech.com</a>
							</span>
						</div>

						<div class="contact-info-row d-flex align-items-center">
							<span class="contact-info-row__icon"> <img
								src="pages-front/img/contact/icon06.png" width="40" height="40"
								alt="">
							</span> <span>160/170-2, 12A Fl., ITF Silom Palace Building Silom
								Rd., Suriyawong, Bangrak Bangrak, Bangkok 10500 Thailand</span>
						</div>

					</div>
				</div>

				<div class="col-12 col-lg-6 contact-column" data-aos="zoom-in"
					data-aos-duration="800">
				<div class="contact-box contact-form-box">
					<h2 class="contact-heading">Contact Us</h2>

					<div class="form-row">
						<div class="form-group col-md-6">
							<input type="text"
								class="form-control ${not empty firstNameError ? 'is-invalid' : ''}"
								placeholder="First name" name="firstName" id="firstName"
								value="${firstName}">
							<div class="invalid-feedback">${firstNameError}</div>
						</div>
						<div class="form-group col-md-6">
							<input type="text"
								class="form-control ${not empty lastNameError ? 'is-invalid' : ''}"
								placeholder="Last name" name="lastName" id="lastName"
								value="${lastName}">
							<div class="invalid-feedback">${lastNameError}</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="bi bi-envelope"></i></span>
							</div>
							<input type="email"
								class="form-control ${not empty emailError ? 'is-invalid' : ''}"
								placeholder="E-Mail" name="contactEmail" id="contactEmail"
								value="${contactEmail}">
							<div class="invalid-feedback">${emailError}</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="bi bi-telephone"></i></span>
							</div>
							<input type="tel"
								class="form-control ${not empty phoneError ? 'is-invalid' : ''}"
								placeholder="Telephone" name="contactTel" id="contactTel"
								value="${contactTel}">
							<div class="invalid-feedback">${phoneError}</div>
						</div>
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="3" placeholder="Message"
							name="contactMessage" id="contactMessage">${contactMessage}</textarea>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="col-lg-10 col-md-11 captcha" id="captcha"></div>
							<button class="col-lg-2 col-md-1 input-group btn btn-info"
								type="button" id="refreshCaptcha"
								style="font-size: 22px; align-items: center; justify-content: center;">
								<i class="fa">&#xf021;</i>
							</button>
						</div>
					</div>
					<div class="form-group">
						<input name="captchaInput" class="form-control" id="captchaInput"
							placeholder="Type the characters above: " />
						<div class="message" id="message"></div>
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

<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	var NAME_PATTERN = /^[ก-๏a-zA-Z\s-]+$/;
	var NAME_MAX_LENGTH = 50;
	var EMAIL_PATTERN = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
	var EMAIL_MAX_LENGTH = 254;
	var PHONE_ALLOWED_CHARS = /^\+?[0-9\s-]+$/;
	var PHONE_LOCAL = /^0[0-9]{8,9}$/;
	var PHONE_INTL = /^\+66[0-9]{8,9}$/;

	var formSubmitAttempted = false;

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
			return 'Invalid phone number - please enter 9-10 digits only';
		}
		var stripped = trimmed.replace(/[\s-]/g, '');
		if (!PHONE_LOCAL.test(stripped) && !PHONE_INTL.test(stripped)) {
			return 'Invalid phone number - please enter 9-10 digits only';
		}
		return null;
	}
	function applyFieldValidation($input, errorMessage, trimmedValue) {
		var $feedback = $input.siblings('.invalid-feedback');
		if (errorMessage) {
			$input.addClass('is-invalid').removeClass('is-valid');
			$feedback.text(errorMessage);
		} else if (trimmedValue) {
			$input.addClass('is-valid').removeClass('is-invalid');
			$feedback.text('');
		} else {

			$input.removeClass('is-valid').removeClass('is-invalid');
			$feedback.text('');
		}
		return !errorMessage;
	}

	function validateField(fieldId) {
		var $input = $('#' + fieldId);
		var value = $input.val();
		var trimmed = (value || '').trim();
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
		return applyFieldValidation($input, errorMessage, trimmed);
	}

	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						AOS.init();
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

																const captcha = $(
																		'#captcha')
																		.text(); // ดึงค่า CAPTCHA
																const userInput = $(
																		'#captchaInput')
																		.val(); // ดึงค่าที่ผู้ใช้กรอก
																// ตรวจสอบว่า CAPTCHA ตรงกับค่าที่กรอกหรือไม่
																if (captcha === userInput) {
																	$(
																			'#message')
																			.text(
																					'CAPTCHA correct')
																			.css(
																					'color',
																					'green');

																	$(
																			'#contactForm')
																			.submit();
																} else {
																	const newCaptcha = generateRandomCaptcha();
																	$(
																			'#captcha')
																			.text(
																					newCaptcha);
																	$(
																			'#message')
																			.text(
																					'Verification failed - please try again')
																			.css(
																					'color',
																					'red');
																}
															});

											$('#refreshCaptcha')
													.click(
															function() {
																$('#captcha')
																		.text(
																				generateRandomCaptcha()); // สร้าง CAPTCHA ใหม่
																$('#message')
																		.text(
																				'');
																$(
																		'#captchaInput')
																		.val('');
															});

											function generateRandomCaptcha() {
												const CAPTCHA_CHARACTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
												let captcha = '';
												for (let i = 0; i < 6; i++) {
													const randomIndex = Math
															.floor(Math
																	.random()
																	* CAPTCHA_CHARACTERS.length);
													captcha += CAPTCHA_CHARACTERS
															.charAt(randomIndex);
												}
												return captcha;
											}

											// สร้าง CAPTCHA เริ่มต้น
											$('#captcha').text(
													generateRandomCaptcha());
										});
					});

	function showNav() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}

	window.onscroll = function() {
		scrollFunction()
	};
	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			document.getElementById("myBtn").style.display = "block";
		} else {
			document.getElementById("myBtn").style.display = "none";
		}
	}
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>
