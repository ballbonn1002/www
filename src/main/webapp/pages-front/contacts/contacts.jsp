<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
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
.breadcrumb {
	padding: 0 !important; 
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
</head>

<div class="parallax show-on-srcoll">
	<div align="center" class="logoservices" data-aos="fade-down"
		data-aos-duration="800">
		<div class="services-block font-weight-bolder">CONTACT</div>
		<br> <font size="5px">Professional IT People ~ Innovative
			IT Solutions<br>
		</font> <font size="3px">IT Staff Outsourcing Services | IT
			consultants | Custom Software Solutions</font> <br> <br>
	</div>

	<form id="contactForm" action="sendEmailContact" method="post">
		<div class="contactbg">
			<ul class="breadcrumb">
				<li><a href="/">Home</a>&nbsp;/&nbsp;</li>
				<li><a class="currentPage" id="model">Contacts</a></li>
			</ul>
			<div class="row">
				<div class="col-lg-6 col-xs-12" data-aos="zoom-in"
					data-aos-duration="800">
					<h1 style="font-weight: bold;">
						<b> <font color="#BD2125" size="4px"> Cube SoftTech
								Co.,Ltd.</font><br> <br>
						</b>
					</h1>
					<div class="row">
						<div class="col-sm-2" align="center">
							<img src="pages-front/img/contact/icon06.png" width="40"
								height="40" />
						</div>
						<div class="col-sm-9 contact-sm">160/170-2, 12A Fl., ITF
							Silom Palace Building Silom Rd., Suriyawong, Bangrak Bangrak,
							Bangkok 10500 Thailand</div>
					</div>
					<div class="row">
						<div class="col-sm-2 contact-sm" align="center">
							<img alt="" src="pages-front/img/contact/icon09.png" width="50"
								height="50">
						</div>
						<div class="col-sm-9 contact-sm" style="padding-top: 14px">
							<a href="tel:026798855">02 679 8855</a>, <a href="tel:0880229400">088
								022 9400</a>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 contact-sm" align="center">
							<img src="pages-front/img/contact/icon07.png" width="40"
								height="40" />
						</div>
						<div class="col-sm-9 contact-sm" style="padding-top: 9px">
							<a href="/cdn-cgi/l/email-protection" class="__cf_email__"
								data-cfemail="e68f888089a685938483958980929283858ec885898b">info@cubesofttech.com</a>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 contact-sm" align="center">
							<img src="pages-front/img/contact/icon08.png" width="55"
								height="55" />
						</div>
						<div class="col-sm-9 contact-sm " style="padding-top: 15px">
							<a href="https://www.facebook.com/CubeSoftTech/">
								https://www.facebook.com/CubeSoftTech/</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-xs-12 contact-us-sm" data-aos="zoom-in"
					data-aos-duration="800">
					<b> <font color="#BD2125" size="4px">Contact Us</font><br>
						<br>
					</b>
					<%--
						Split from a single "Name" field into firstName/lastName -
						ContactsAction (shared with the redesign page) no longer has
						a contactName property, so this has to stay in sync with
						that rename or submissions from this page would silently
						send a blank name.
					--%>
					<div class="form-row">
						<div class="form-group col-md-6">
							<input type="text"
								class="form-control ${not empty firstNameError ? 'is-invalid' : ''}"
								placeholder="First name" name="firstName" id="firstName"
								value="${fn:escapeXml(firstName)}">
							<div class="invalid-feedback">${firstNameError}</div>
						</div>
						<div class="form-group col-md-6">
							<input type="text"
								class="form-control ${not empty lastNameError ? 'is-invalid' : ''}"
								placeholder="Last name" name="lastName" id="lastName"
								value="${fn:escapeXml(lastName)}">
							<div class="invalid-feedback">${lastNameError}</div>
						</div>
					</div>
					<div class="form-group">
						<input type="email"
							class="form-control ${not empty emailError ? 'is-invalid' : ''}"
							placeholder="E-Mail" name="contactEmail" id="contactEmail"
							value="${fn:escapeXml(contactEmail)}">
						<div class="invalid-feedback">${emailError}</div>
					</div>
					<div class="form-group">
						<input type="tel"
							class="form-control ${not empty phoneError ? 'is-invalid' : ''}"
							placeholder="Telephone" name="contactTel" id="contactTel"
							value="${fn:escapeXml(contactTel)}">
						<div class="invalid-feedback">${phoneError}</div>
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="3" placeholder="Message"
							name="contactMessage" id="contactMessage">${fn:escapeXml(contactMessage)}</textarea>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="col-lg-10 col-md-11 captcha" id="captcha"></div>
							<button class="col-lg-2 col-md-1 input-group btn btn-info" type="button" id="refreshCaptcha" 
								style="font-size:22px; align-items: center; justify-content: center;"><i class="fa">&#xf021;</i></button>
						</div>
					</div>
					<div class="form-group">
						<input name="captchaInput" class="form-control" id="captchaInput" placeholder="Type the characters above: " />
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
<div style="overflow: hidden;">
	<iframe
		src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.858308665869!2d100.52603131477895!3d13.727026990363473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30e29f258dd25adf%3A0x7ebb9335dc44b9d2!2sCube%20SoftTech%20Co.%2C%20Ltd.!5e0!3m2!1sth!2sth!4v1567563105166!5m2!1sth!2sth"
		width="100%" height="450" frameborder="0" style="border: 0;"
		allowfullscreen=""></iframe>
</div>

<%--
	aos.css/aos.js and jQuery both already load once in baseLayout.jsp's
	<head> (every page shares it) - this page had its own second copy of
	both. Safe to drop here specifically (checked first): the CAPTCHA
	logic below only uses basic jQuery (click/text/val/css/on), no
	$.ajax/.load/effects methods.
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
			return 'กรุณากรอกเฉพาะตัวอักษร ไม่ใช่ตัวเลขหรือสัญลักษณ์';
		}
		return null;
	}

	function validateEmailValue(value) {
		var trimmed = (value || '').trim();
		if (!trimmed) {
			return 'กรุณากรอกอีเมล';
		}
		if (trimmed.length > EMAIL_MAX_LENGTH || !EMAIL_PATTERN.test(trimmed)) {
			return 'อีเมลไม่ถูกต้อง กรุณาตรวจสอบอีกครั้ง (เช่น name@example.com)';
		}
		return null;
	}

	function validatePhoneValue(value) {
		var trimmed = (value || '').trim();
		if (!trimmed) {
			return 'กรุณากรอกเบอร์โทรศัพท์';
		}
		if (!PHONE_ALLOWED_CHARS.test(trimmed)) {
			return 'เบอร์โทรศัพท์ไม่ถูกต้อง กรุณากรอกเฉพาะตัวเลข 9-10 หลัก';
		}
		var stripped = trimmed.replace(/[\s-]/g, '');
		if (!PHONE_LOCAL.test(stripped) && !PHONE_INTL.test(stripped)) {
			return 'เบอร์โทรศัพท์ไม่ถูกต้อง กรุณากรอกเฉพาะตัวเลข 9-10 หลัก';
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
			errorMessage = validateNameValue(value, 'กรุณากรอกชื่อ');
		} else if (fieldId === 'lastName') {
			errorMessage = validateNameValue(value, 'กรุณากรอกนามสกุล');
		} else if (fieldId === 'contactEmail') {
			errorMessage = validateEmailValue(value);
		} else if (fieldId === 'contactTel') {
			errorMessage = validatePhoneValue(value);
		}
		return applyFieldValidation($input, errorMessage);
	}

	document.addEventListener('DOMContentLoaded', function() {
		AOS.init();
	});
	$(document).ready(function() {

		// Real-time feedback as each field loses focus, rather than only
		// finding out everything's wrong at once on submit.
		$('#firstName, #lastName, #contactEmail, #contactTel').on('blur', function() {
			validateField(this.id);
		});

		// เมื่อกดปุ่ม "Send"
	    $('#sendEmail').click(function (e) {
	    	e.preventDefault(); // ป้องกันการส่งฟอร์มทันที

	    	// ตรวจก่อน CAPTCHA - เรียก validator เดียวกับที่ blur ใช้
	    	// ให้แน่ใจว่าทุกช่องผ่านครบก่อนไปเช็ค CAPTCHA
	    	var firstNameValid = validateField('firstName');
	    	var lastNameValid = validateField('lastName');
	    	var emailValid = validateField('contactEmail');
	    	var phoneValid = validateField('contactTel');
	    	if (!firstNameValid || !lastNameValid || !emailValid || !phoneValid) {
	    		return;
	    	}

	    	const captcha = $('#captcha').text(); // ดึงค่า CAPTCHA
	        const userInput = $('#captchaInput').val(); // ดึงค่าที่ผู้ใช้กรอก
	        // ตรวจสอบว่า CAPTCHA ตรงกับค่าที่กรอกหรือไม่
	        if (captcha === userInput) {
	            $('#message').text('CAPTCHA ถูกต้อง').css('color', 'green');

	            // ส่งฟอร์มจริงหลังจากยืนยัน CAPTCHA ถูกต้อง
	            $('#contactForm').submit(); // ส่งฟอร์มจริง
	        } else {
	            const newCaptcha = generateRandomCaptcha();
	            $('#captcha').text(newCaptcha);
	            $('#message').text('การยืนยันล้มเหลว! กรุณาลองใหม่').css('color', 'red');
	        }
	    });

	    // เมื่อกดปุ่ม "รีเฟรช" CAPTCHA
	    $('#refreshCaptcha').click(function () {
	        $('#captcha').text(generateRandomCaptcha()); // สร้าง CAPTCHA ใหม่
	        $('#message').text('');
	        $('#captchaInput').val('');
	    });

	    // ฟังก์ชันสำหรับสร้าง CAPTCHA
	    function generateRandomCaptcha() {
	        const CAPTCHA_CHARACTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
	        let captcha = '';
	        for (let i = 0; i < 6; i++) {
	            const randomIndex = Math.floor(Math.random() * CAPTCHA_CHARACTERS.length);
	            captcha += CAPTCHA_CHARACTERS.charAt(randomIndex);
	        }
	        return captcha;
	    }

	    // สร้าง CAPTCHA เริ่มต้น
	    $('#captcha').text(generateRandomCaptcha());
	});
	
	function showNav() {
        var x = document.getElementById("navDemo");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
	
	window.onscroll = function () { scrollFunction() };
	function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
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
</html>