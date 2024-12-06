<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<li><a href="${requestURI}" id="model">Contacts</a></li>
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
					<div class="form-group">
						<input type="name" class="form-control" placeholder="Name"
							name="contactName">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="E-Mail"
							name="contactEmail">
					</div>
					<div class="form-group">
						<input type="phone" class="form-control" placeholder="Telephone"
							name="contactTel">
					</div>
					<div class="form-group">
						<textarea type="comment" class="form-control" rows="3"
							placeholder="Message" name="contactMessage"></textarea>
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

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	AOS.init();
	$(document).ready(function() {
		$('a[href^="/contacts"]').addClass('active');
		$('#model').removeClass('active');

		// เมื่อกดปุ่ม "Send"
	    $('#sendEmail').click(function (e) {
	    	e.preventDefault(); // ป้องกันการส่งฟอร์มทันที
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