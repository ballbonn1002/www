<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<meta name="description"
	content="Cube SoftTech is an innovative, high-quality software development company. We are a professional company, focused on IT consulting, web application development &amp; integration. Our services cover every aspect of web / mobile development, from start to finish. From one off projects to a fully outsourced development team., Java Outsourcing, IT Staff Outsourcing, IT Outsource, Staff Outsourcing, IT Staffing solutions, Outsource IT Staff, เอ้าซอร์สซิ่ง, ไอที เอ้าซอร์สซิ่ง">
<meta name="keywords"
	content="Java Outsourcing, IT Staff Outsourcing, Outsource IT Staff, IT Outsource, Staff Outsourcing, IT Staffing solutions, เอ้าซอร์สซิ่ง, ไอที เอ้าซอร์สซิ่ง, IT Solution, IT Consulting, Software Development, Software Solutions, Mobile Software, Mobile Software Development Company, พัฒนาโปรแกรม, พัฒนาซอฟต์แวร์, พัฒนาโมบายล์แอพพลิเคชั่น, โมบายด์แอพพลิเคชั่น, ออกแบบและวิเคราะห์ระบบ, Custom Software solutions, IT Staff Outsourcing services, IT Services, Web Development, JAVA Development, J2EE Web Development, รับพัฒนาโปรแกรมภาษา Java, จาวา, project management, it consultancy">
<meta name="classification" content="Computers and Internet">
<meta name="robots" content="all">
<meta name="googlebot" content="archive">
<meta name="distribution" content="Global">
<meta name="language" content="en-th">
<meta name="rating" content="General">
<meta name="expires" content="Never">
<meta http-equiv="pragma" content="cache">
<meta name="MSSmartTagsPreventParsing" content="true">
<meta http-equiv="reply-to">
<meta name="revisit-after" content="7 Days">
<!-- <meta http-equiv="Permissions-Policy" content="geolocation=(self), microphone=(), camera=()"> -->

<!-- Google Tag Manager -->
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-NF235VW');
</script>
<!-- End Google Tag Manager -->

<!--  Can Share Stats and Data with Google Search Console & Google Tag Manager -->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-25549236-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-25549236-1');
</script>
<!-- END Global site tag (gtag.js) - Google Analytics -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- <link rel="stylesheet" type="text/css" href="css/style.css"> -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>
body, html {
	font-family: 'Open Sans', sans-serif;
	font-size: 15px;
	scroll-behavior: smooth;
}

#navbar-hover:hover {
	color: #BD2125 !important;
	text-decoration: none;
	border-color: white white #BD2125 !important;
	border-bottom: 4px solid;
}

.parallax {
	/* Set a specific height */
	min-height: 500px;
	/* Create the parallax scrolling effect */
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.parallax2 {
	background-color: rgb(240, 240, 240);
	/* Set a specific height */
	min-height: 500px;
	/* Create the parallax scrolling effect */
	background-attachment: fixed;
	background-position: top right;
	background-repeat: no-repeat;
	background-size: 900px;
}

.active {
	border-color: white white #BD2125 !important;
	border-bottom: 4px solid;
	color: #BD2125 !important;
}

.setpo {
	margin-right: -20px;
}

.container {
	z-index: 0;
	width: 100%;
}

.header {
	position: fixed;
	top: 0;
	z-index: 1;
	width: 100%;
	background-color: #f1f1f1;
}

/* The progress container (grey background) */

/* The progress bar (scroll indicator) */
.progress-bar {
	height: 0px;
	background: #BD2125;
	width: 0%;
	margin: 0 0 0;
}

.navbar-light .navbar-toggler-icon {
	background-image:
		url(https://cdn.dribbble.com/users/976841/screenshots/3452262/dribbble-upload.gif)
		!important;
}

.welcomebg {
	background-color: white;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
}

.welcomecon {
	margin-left: 15%;
	margin-right: 15%;
	padding-top: 5%;
	padding-bottom: 15px;
}

.detail {
	background-color: white;
	box-shadow: 0px 10px 20px -5px rgba(0, 0, 0, 0.75);
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 10%;
	margin-bottom: 5%;
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 5%;
}

@media screen and (max-width: 870px) {
	.vl {
		display: none;
	}
	.detail {
		background-color: white;
		box-shadow: 0px 10px 20px -5px rgba(0, 0, 0, 0.75);
		margin-left: 2%;
		margin-right: 2%;
		margin-top: 15%;
		margin-bottom: 1%;
		padding-left: 5%;
		padding-right: 5%;
		padding-top: 5%;
	}
}

.servicecon {
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 5%;
	padding-left: 2%;
	padding-right: 2%;
	padding-bottom: 2%;
	padding-top: 2%;
}

.logo {
	padding-bottom: 100px;
	padding-top: 150px;
	padding-left: 15%;
	padding-right: 10px;
}

p {
	margin: 0 0 0;
}

#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: #BD2125;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
}

#myBtn:hover {
	background-color: #555;
}

.nava {
	padding-left: 10%;
}

.serviceimg {
	position: absolute;
}

.icon {
	width: 100px;
	height: 85px;
}

.bar {
	width: 30px;
	height: 3px;
	background-color: #333;
	margin: 6px 0;
	transition: 0.4s;
}

.logoservices {
	padding-bottom: 010px;
	padding-top: 100px;
}

.services-block {
	background-color: #BD2125;
	width: 200px;
	color: white;
	font-size: 32px;
}

.footerbg {
	background-color: white;
	text-align: center;
	padding-left: 10%;
	padding-right: 10%;
}

.vl {
	border-left: 2px solid rgb(233, 233, 233);
	height: 140px;
}

@media screen and (max-width: 870px) {
	.vl {
		display: none;
	}
	.imgservices {
		display: none;
	}
	.welcomecon {
		margin-left: 5%;
		margin-right: 5%;
		padding-top: 5%;
		padding-bottom: 15px;
	}
	.parallax {
		display: none;
	}
}

@media screen and (min-width: 870px) {
	.imgservices2 {
		display: none;
	}
	.parallax2 {
		display: none;
	}
}

.hl {
	border-left: 2px solid rgb(233, 233, 233);
	height: 1px;
	text-align: center;
}

.ft {
	border-bottom: 2px solid rgb(233, 233, 233);
}

a {
	color: #000;
}

.servicebg {
	background-color: white;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
	padding-bottom: 2%;
	padding-top: 2%;
}

.servicebg1 {
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
}

.logo {
	padding-bottom: 100px;
	padding-top: 150px;
	padding-left: 15%;
	padding-right: 10%;
}

.customerbg {
	background-color: rgb(255, 255, 255);
	margin-top: 5%;
	margin-bottom: 5%;
	padding-top: 5%;
	padding-bottom: 5%;
	padding-left: 5%;
	padding-right: 5%;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
}

.contactbg {
	background-color: white;
	padding-top: 5%;
	padding-left: 10%;
	padding-right: 10%;
	padding-bottom: 2%;
}

.videocon {
	position: static;
	overflow: hidden;
	width: 100%;
	padding-top: 56.25%; /* 16:9 Aspect Ratio (divide 9 by 16 = 0.5625) */
}

.responsive-iframe {
	position: absolute;
	top: 0;
	left: 10%;
	bottom: 0;
	right: 0;
	width: 80%;
	height: 100%;
}
/* Slideshow container */
.slideshow-container {
	position: relative;
}

.slideshow-container1 {
	position: relative;
	background-color: #F5F5F5;
	height: 600px;
}
/* Slides */
.mySlides {
	display: none;
	text-align: center;
	background-color: #2E2E2E;
	margin-left: 10%;
	margin-right: 10%;
	height: 100%;
}

.mySlides1 {
	display: none;
	text-align: center;
	margin-left: 10%;
	margin-right: 10%;
	height: 100%;
}

.logojob {
	padding-bottom: 50px;
	padding-top: 100px;
}

.job-block {
	background-color: #BD2125;
	width: 200px;
	color: white;
	font-size: 32px;
}

.jobbg {
	background-color: white;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
}

.jobon {
	margin-left: 10%;
	margin-right: 10%;
	padding-top: 3%;
	padding-bottom: 5%;
}

.jobon1 {
	margin-left: 5%;
	margin-right: 5%;
	padding-top: 3%;
	padding-bottom: 3%;
}

.jobon2 {
	margin-left: 10%;
	margin-right: 10%;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
}

.jobf {
	margin-top: 79px;
}

.pagination {
	position: absolute;
	bottom: 1;
	right: 0;
}

.perkcon {
	background-color: white;
	margin-left: 10%;
	margin-right: 10%;
	padding-left: 2%;
	padding-right: 2%;
	padding-bottom: 2%;
	padding-top: 2%;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
}

.perkcon1 {
	margin-left: 3%;
	margin-right: 3%;
}

.perkbg {
	background-color: #F5F5F5;
	padding-bottom: 2%;
	padding-top: 2%;
}

.perkbg1 {
	background-color: #DEDEDE;
	padding-bottom: 2%;
	padding-top: 2%;
}

.iconperk {
	width: 80px;
	height: 65px;
}

.Intern-block {
	background-color: white;
	color: #BD2125;
	font-size: 16px;
	margin-top: 10px;
	margin-left: 10px;
	text-align: center;
	width: 190px;
	padding: 5px;
	border-radius: 20px 20px 20px 20px;
}

.Intern-block1 {
	color: white;
	font-size: 20px;
	margin-top: 10%;
	margin-left: 10%;
	margin-right: 5%;
	margin-bottom: 10%;
	text-align: left;
	padding: 5px;
	height: 250px;
}

.nameIntern {
	background-color: #C85250;
	text-align: right;
	bottom: 0;
	padding-top: 10px;
	padding-bottom: 10px;
	width: 110%;
}

.nameIntern1 {
	margin-right: 8%;
}

.imgIntern {
	position: absolute;
	height: 100%;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	margin-top: -30px;
	padding: 10px;
	font-weight: bold;
	font-size: 20px;
	border-radius: 100px 100px 100px 100px;
	user-select: none;
	margin-left: 3%;
	margin-right: 3%;
	background-color: rgb(255, 0, 0, 0.5);
	height: 50px;
	width: 50px;
}
/* Position the "next button" to the right */
.next {
	position: absolute;
	right: 0;
}

.prev {
	position: absolute;
	left: 0;
}
</style>
</head>
<body>
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NF235VW"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<tiles:insertAttribute name="header" ignore="true" />
	<tiles:insertAttribute name="body" ignore="true" />
	<tiles:insertAttribute name="footer" ignore="true" />
</body>
</html>