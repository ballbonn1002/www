<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="language" content="en-th">
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

	<form action="sendEmailContact" method="post">
		<div class="contactbg">
			<div class="row">
				<div class="col-lg-6 col-xs-12" data-aos="zoom-in"
					data-aos-duration="800">
					<b> <font color="#BD2125" size="4px"> Cube SoftTech
							Co.,Ltd.</font><br> <br>
					</b>
					<div class="row">
						<div class="col-sm-2" align="center">
							<img src="pages-front/img/contact/icon06.png" width="40" height="40" />
						</div>
						<div class="col-sm-9 contact-sm">160/170-2, 12A Fl., ITF
							Silom Palace Building Silom Rd., Suriyawong, Bangrak Bangrak,
							Bangkok 10500 Thailand</div>
					</div>
					<div class="row">
						<div class="col-sm-2 contact-sm" align="center">
							<img alt="" src="pages-front/img/contact/icon09.png" width="50" height="50">
						</div>
						<div class="col-sm-9 contact-sm" style="padding-top: 14px">
							02 679 8855, 088 022 9400</div>
					</div>
					<div class="row">
						<div class="col-sm-2 contact-sm" align="center">
							<img src="pages-front/img/contact/icon07.png" width="40" height="40" />
						</div>
						<div class="col-sm-9 contact-sm" style="padding-top: 9px">
							<a href="/cdn-cgi/l/email-protection" class="__cf_email__"
								data-cfemail="e68f888089a685938483958980929283858ec885898b">info@cubesofttech.com</a>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 contact-sm" align="center">
							<img src="pages-front/img/contact/icon08.png" width="55" height="55" />
						</div>
						<div class="col-sm-9 contact-sm " style="padding-top: 15px">
						<a href="https://www.facebook.com/CubeSoftTech/">
							https://www.facebook.com/CubeSoftTech/</div>
							</a>
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
					<div class="form-group text-right">
						<button type="submit" class="btn btn-danger" value="submit">Send</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<div style="overflow: hidden;">
    <iframe
    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.858308665869!2d100.52603131477895!3d13.727026990363473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30e29f258dd25adf%3A0x7ebb9335dc44b9d2!2sCube%20SoftTech%20Co.%2C%20Ltd.!5e0!3m2!1sth!2sth!4v1567563105166!5m2!1sth!2sth"
    width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
</div>

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	AOS.init();
	$(document).ready(function() {
		$('a[href^="/contacts"]').addClass('active');
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