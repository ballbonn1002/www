<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="comp"%>

<%--
	Redesign starting point - copied from pages-front/contacts/contacts.jsp
	as-is (functionally), with one structural fix: the original file wrapped
	itself in <!DOCTYPE html><html><head>...</head>...</html>, which is
	invalid here since this JSP only ever renders as the "body" Tiles
	attribute inside baseLayout.jsp's own <body> (see struts-tiles.xml's
	contacts.redesign definition) - same reasoning as redesign/blog/blog.jsp,
	which has no such wrapper either. The LocalBusiness JSON-LD schema and
	the page <style> block that were inside that <head> are kept, just
	unwrapped.

	Everything else (form fields/action, CAPTCHA, map embed, script includes)
	is untouched - this is meant to be redesigned from here, not already
	redesigned.
--%>
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

.contact-info-column {
	display: flex;
}

/* Photo background (pages-front/img/contact/team-desk-bg.jpg, royalty-free)
   instead of a flat tint - still deliberately no box-shadow, the form
   column is the one surface meant to read as raised/elevated
   (.contact-form-box below). The ::before overlay darkens the photo for
   text contrast without baking that darkness into the image file itself,
   so it stays easy to tune later. Text inside switches to white via the
   scoped .contact-heading/a overrides below - the same .contact-heading
   class is also used on .contact-form-box's "Contact Us" heading, which
   needs to stay the brand red it already had on that white background. */
.contact-info-group {
	/* .contact-info-column's default flex-direction is row - without this,
	   a flex item sizes to its own content by default (flex-basis:auto),
	   so as the row's only child it would shrink to wrap its text/icons
	   instead of spanning the column, only stretching in height. flex:1
	   makes it grow to fill the remaining width too. */
	flex: 1;
	position: relative;
	background: url("pages-front/img/contact/team-desk-bg.jpg") center/cover
		no-repeat;
	border-radius: 16px;
	padding: 40px;
	color: #fff;
	/* Content vertically centered in the box - now that this box stretches
	   to match .contact-form-box's height, its own rows/headings would
	   otherwise just sit at the top with empty space below if the form
	   column ends up taller. */
	display: flex;
	flex-direction: column;
	justify-content: center;
}

/* padding-top combines the page's own 3% breathing room with
   --navbar-offset (defined once in header.jsp) for real structural
   clearance under the fixed navbar - same fix as .articleblockbg in
   blog.css, was independently guessed as margin-top:32px here too
   before, which under-shot the navbar's actual ~80px footprint.
   padding, not margin, so .contactbg's own background-color fills
   that space too instead of showing the page background through a
   gap. */
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
	/* Bumped from 0.65 - this photo (bright café/laptop screen) runs a lot
	   lighter overall than the wood-desk one it replaced, so the white text
	   needed more darkening underneath it to stay readable. */
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

/* One row per company-info line (address/phone/email/Facebook), replacing
   the old .row > .col-sm-2 + .col-sm-9 grid plus a hand-tuned inline
   padding-top per row to nudge the icon into line with its text - flex's
   align-items:center does that for every row uniformly instead. */
.contact-info-row {
	gap: 1rem;
	margin-bottom: 1.5rem;
}

.contact-info-row:last-child {
	margin-bottom: 0;
}

/* Bigger than the site's 15px base - this box has more visual weight now
   (photo background, centered content) so the copy needed to scale up to
   match instead of looking small against it. Scoped past the icon badge
   (:not) so the badge's own icon sizing above is untouched. */
.contact-info-row span:not(.contact-info-row__icon) {
	font-size: 17px;
}

/* Circular badge normalizes the four source icons (40-55px, inconsistent
   sizes) into one consistent footprint instead of resizing the actual PNG
   files - object-fit:contain on the img inside keeps each icon's own
   aspect ratio. */
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

/* Icon-font entries (bi-clock, no PNG asset exists for these) share the
   same badge - sized/colored here since an <i> glyph has no intrinsic
   size like the PNGs do. */
.contact-info-row__icon i {
	font-size: 20px;
	color: #BD2125;
}

/* Second group, same flat/tinted treatment as .contact-info-group so the
   two read as a matched pair - just spaced below the first instead of
   sharing its box. */
.contact-social-group {
	margin-top: 1.5rem;
}

.contact-social-links {
	display: flex;
	gap: 0.75rem;
}

/* Circular badges, same 44px footprint as .contact-info-row__icon above,
   for the same reason - one consistent size across both groups. Hover
   inverts fg/bg instead of just a color change, since these are the only
   icons on this page that are themselves the click target (not just
   decoration next to a text link). */
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

/* Moved off the inline style on the column div - same padding/radius/
   shadow values, just as a named rule instead of a one-off inline block.
   This is the page's one elevated surface (see .contact-info-group above). */
.contact-form-box {
	background-color: #fff;
	border-radius: 16px;
	padding: 40px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

/* Bootstrap 4's own .form-control default is border-radius:0.25rem (4px) -
   overriding just within this form to match the rounder 16px boxes/badges
   used everywhere else on this page. */
.contact-form-box .form-control {
	border-radius: 10px;
}

/* #sendEmail specifically (not every .btn-danger site-wide) - same 10px
   radius as the inputs above for one consistent look, and full-width
   since a form this size reads better with one clear, wide call to
   action than a small button off to the side. */
#sendEmail {
	border-radius: 10px;
	width: 100%;
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
			<div class="row">
				<div class="col-12 col-lg-6 contact-info-column" data-aos="zoom-in"
					data-aos-duration="800">
					<div class="contact-info-group">
						<h2 class="contact-heading">Cube SoftTech Co.,Ltd.</h2>

						<%-- No PNG icon asset for business hours - bi-clock (Bootstrap
							 Icons, already loaded site-wide in baseLayout.jsp) instead of
							 adding a new image file. --%>
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

						<%--
							One box now, not two - Social Media is just a second
							sub-section inside the same .contact-info-group, spaced apart
							with .contact-social-group's margin-top instead of its own
							background/border. Line/LinkedIn/YouTube hrefs are
							placeholders ("#") - only the Facebook URL is real (carried
							over from the row removed earlier). Swap in the actual
							company links before this goes live.
						--%>
					</div>
				</div>

				<div class="col-12 col-lg-6 contact-form-box" data-aos="zoom-in"
					data-aos-duration="800">
					<h2 class="contact-heading">Contact Us</h2>
					<%--
						col-md-6 rather than col-6 - below md this form still sits
						inside a col-12 (single-column, full page width) at that
						breakpoint since the page's own two-column split only kicks
						in at lg, so there's no room concern for these two side by
						side once md hits; below md they stack full-width instead of
						being squeezed to a cramped half-width each on small phones.
					--%>
					<%--
						value="${...}"/is-invalid/.invalid-feedback below are the
						server-side half of validation (see ContactsAction -
						firstName/firstNameError etc. are request attributes it sets,
						empty/absent on a fresh GET). is-invalid is a Bootstrap 4
						class (red border), .invalid-feedback is Bootstrap's matching
						message element (red text, shown via Bootstrap's own CSS
						whenever the sibling input carries is-invalid) - the blur
						handlers below toggle the exact same classes client-side, so
						a field looks identical whichever side caught the problem.
					--%>
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
						<input type="email"
							class="form-control ${not empty emailError ? 'is-invalid' : ''}"
							placeholder="E-Mail" name="contactEmail" id="contactEmail"
							value="${contactEmail}">
						<div class="invalid-feedback">${emailError}</div>
					</div>
					<div class="form-group">
						<input type="tel"
							class="form-control ${not empty phoneError ? 'is-invalid' : ''}"
							placeholder="Telephone" name="contactTel" id="contactTel"
							value="${contactTel}">
						<div class="invalid-feedback">${phoneError}</div>
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
		</form>
	</div>

</div>
<div style="overflow: hidden;">
	<iframe
		src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.858308665869!2d100.52603131477895!3d13.727026990363473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30e29f258dd25adf%3A0x7ebb9335dc44b9d2!2sCube%20SoftTech%20Co.%2C%20Ltd.!5e0!3m2!1sth!2sth!4v1567563105166!5m2!1sth!2sth"
		width="100%" height="450" frameborder="0" style="border: 0;"
		allowfullscreen=""></iframe>
</div>

<%--
	aos.css/aos.js and jQuery both already load once in baseLayout.jsp's
	<head> (every page shares it) - this page had its own second copy of
	both. Safe to drop here specifically (checked first): the CAPTCHA and
	real-time validation logic below only use basic jQuery (click/text/
	val/css/on/siblings), no $.ajax/.load/effects methods. AOS.init()
	below still needs to stay - baseLayout.jsp only loads the library,
	each page still calls .init() itself.
--%>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	// Mirrors com.cubesofttech.validation.ContactFormValidator - there's no
	// shared code path between Java and this vanilla JS, so this is a
	// manually-kept-in-sync copy of the same rules. Server-side (see
	// ContactsAction) is the authoritative check; this is real-time (blur)
	// feedback only and can't be relied on alone.
	var NAME_PATTERN = /^[ก-๏a-zA-Z\s-]+$/;
	var NAME_MAX_LENGTH = 50;
	var EMAIL_PATTERN = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
	var EMAIL_MAX_LENGTH = 254;
	var PHONE_ALLOWED_CHARS = /^\+?[0-9\s-]+$/;
	var PHONE_LOCAL = /^0[0-9]{8,9}$/;
	var PHONE_INTL = /^\+66[0-9]{8,9}$/;

	function validateNameValue(value, requiredMessage) {
		var trimmed = (value || '').trim();
		if (!trimmed) {
			return requiredMessage;
		}
		if (trimmed.length > NAME_MAX_LENGTH || !NAME_PATTERN.test(trimmed)) {
			return 'Please enter letters only, not numbers or symbols';
		}
		return null;
	}

	function validateEmailValue(value) {
		var trimmed = (value || '').trim();
		if (!trimmed) {
			return 'Please enter your email';
		}
		if (trimmed.length > EMAIL_MAX_LENGTH || !EMAIL_PATTERN.test(trimmed)) {
			return 'Invalid email - please check and try again (e.g. name@example.com)';
		}
		return null;
	}

	function validatePhoneValue(value) {
		var trimmed = (value || '').trim();
		if (!trimmed) {
			return 'Please enter your phone number';
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

	// Applies one field's result to the DOM (Bootstrap's own
	// is-invalid/is-valid + the .invalid-feedback sibling it already
	// renders server-side) - the one place both the blur handlers and the
	// pre-submit check below touch the DOM, so a field looks identical
	// regardless of which one caught the problem.
	function applyFieldValidation($input, errorMessage) {
		var $feedback = $input.siblings('.invalid-feedback');
		if (errorMessage) {
			$input.addClass('is-invalid').removeClass('is-valid');
			$feedback.text(errorMessage);
		} else {
			$input.addClass('is-valid').removeClass('is-invalid');
			$feedback.text('');
		}
		return !errorMessage;
	}

	function validateField(fieldId) {
		var $input = $('#' + fieldId);
		var value = $input.val();
		var errorMessage;
		if (fieldId === 'firstName') {
			errorMessage = validateNameValue(value, 'Please enter your first name');
		} else if (fieldId === 'lastName') {
			errorMessage = validateNameValue(value, 'Please enter your last name');
		} else if (fieldId === 'contactEmail') {
			errorMessage = validateEmailValue(value);
		} else if (fieldId === 'contactTel') {
			errorMessage = validatePhoneValue(value);
		}
		return applyFieldValidation($input, errorMessage);
	}

	// DOMContentLoaded, not $(document).ready() directly - $ isn't
	// guaranteed to exist yet at this point (jQuery loads deferred from
	// baseLayout.jsp; this page's own local copy was already removed -
	// see the comment above). Deferred scripts always finish before
	// DOMContentLoaded fires, so $ is ready by the time this callback
	// runs. Without this wrap, $(document).ready(...) below threw
	// immediately and silently killed this entire script block -
	// including the CAPTCHA generation and all the blur-validation
	// handlers further down, which is why both looked broken at once.
	document.addEventListener('DOMContentLoaded', function() {
	AOS.init();
	$(document)
			.ready(
					function() {

						// Real-time feedback as each field loses focus,
						// rather than only finding out everything's wrong
						// at once on submit.
						$('#firstName, #lastName, #contactEmail, #contactTel')
								.on('blur', function() {
									validateField(this.id);
								});

						// เมื่อกดปุ่ม "Send"
						$('#sendEmail')
								.click(
										function(e) {
											e.preventDefault(); // ป้องกันการส่งฟอร์มทันที

											// ตรวจก่อน CAPTCHA - เรียก validator
											// เดียวกับที่ blur ใช้ ให้แน่ใจว่าทุกช่อง
											// ผ่านครบก่อนไปเช็ค CAPTCHA
											var firstNameValid = validateField('firstName');
											var lastNameValid = validateField('lastName');
											var emailValid = validateField('contactEmail');
											var phoneValid = validateField('contactTel');
											if (!firstNameValid || !lastNameValid
													|| !emailValid || !phoneValid) {
												return;
											}

											const captcha = $('#captcha')
													.text(); // ดึงค่า CAPTCHA
											const userInput = $('#captchaInput')
													.val(); // ดึงค่าที่ผู้ใช้กรอก
											// ตรวจสอบว่า CAPTCHA ตรงกับค่าที่กรอกหรือไม่
											if (captcha === userInput) {
												$('#message').text(
														'CAPTCHA correct').css(
														'color', 'green');

												// ส่งฟอร์มจริงหลังจากยืนยัน CAPTCHA ถูกต้อง
												$('#contactForm').submit(); // ส่งฟอร์มจริง
											} else {
												const newCaptcha = generateRandomCaptcha();
												$('#captcha').text(newCaptcha);
												$('#message')
														.text(
																'Verification failed - please try again')
														.css('color', 'red');
											}
										});

						// เมื่อกดปุ่ม "รีเฟรช" CAPTCHA
						$('#refreshCaptcha').click(function() {
							$('#captcha').text(generateRandomCaptcha()); // สร้าง CAPTCHA ใหม่
							$('#message').text('');
							$('#captchaInput').val('');
						});

						// ฟังก์ชันสำหรับสร้าง CAPTCHA
						function generateRandomCaptcha() {
							const CAPTCHA_CHARACTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
							let captcha = '';
							for (let i = 0; i < 6; i++) {
								const randomIndex = Math.floor(Math.random()
										* CAPTCHA_CHARACTERS.length);
								captcha += CAPTCHA_CHARACTERS
										.charAt(randomIndex);
							}
							return captcha;
						}

						// สร้าง CAPTCHA เริ่มต้น
						$('#captcha').text(generateRandomCaptcha());
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
