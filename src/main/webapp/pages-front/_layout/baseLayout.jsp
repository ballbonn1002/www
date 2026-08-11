<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="utf-8">
<%-- Critical inline CSS so first paint matches the site background before per-page styles load. --%>
<style>
html{background-color:#F5F5F5;}
/* Toggled via .is-loading by the click listener further down - gives instant feedback on internal link clicks. */
#page-loading-bar {
	position: fixed;
	top: 0;
	left: 0;
	height: 3px;
	width: 0;
	background-color: #BD2125;
	z-index: 99999;
	opacity: 0;
	transition: width 0.4s ease-out, opacity 0.2s ease-out;
}
#page-loading-bar.is-loading {
	width: 90%;
	opacity: 1;
	transition: width 4s cubic-bezier(0.1, 0.5, 0.1, 1), opacity 0.2s ease-out;
}

/* Cross-document @view-transition was tried here but caused stacked scrollbars during the transition - removed. */
</style>
<title><tiles:insertAttribute name="title" ignore="true" />${title}</title>
<link rel="icon" type="image/x-icon"
	href="/pages-front/img/logo/favicon.png">
<link rel="canonical" href="https://www.cubesofttech.com${requestURI}">
<%-- pageBaseUri/currentPage/totalPages are only set by BlogAction.init()
	 (blog/news listing pages) - every other page just skips this block. --%>
<c:if test="${not empty pageBaseUri}">
	<c:if test="${currentPage > 1}">
		<link rel="prev"
			href="https://www.cubesofttech.com${pageBaseUri}?page=${currentPage - 1}">
	</c:if>
	<c:if test="${currentPage < totalPages}">
		<link rel="next"
			href="https://www.cubesofttech.com${pageBaseUri}?page=${currentPage + 1}">
	</c:if>
	<%-- blog.css is actually <link>'d from inside blog.jsp's body - preloading here starts the fetch earlier. --%>
	<link rel="preload" as="style"
		href="/pages-front/redesign/assets/css/blog.css">
</c:if>
<%-- Hero image preload for the blog "แนะนำล่าสุด" section; newBlog is only set on the blog/news listing pages. --%>
<c:if test="${not empty newBlog}">
	<link rel="preload" as="image"
		href="${constant.imgContext}/${newBlog.path}" fetchpriority="high">
</c:if>
<meta name="description" content="${meta}">
<meta name="keywords" content="">

<meta name="classification" content="Computers and Internet">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="googlebot"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
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

<%-- preconnect for every external origin this head loads a stylesheet/script from, so DNS+TLS happens early instead of staggered. --%>
<link rel="preconnect" href="https://stackpath.bootstrapcdn.com"
	crossorigin>
<link rel="preconnect" href="https://code.jquery.com" crossorigin>
<link rel="preconnect" href="https://cdnjs.cloudflare.com" crossorigin>
<link rel="preconnect" href="https://use.fontawesome.com" crossorigin>
<link rel="preconnect" href="https://www.w3schools.com">
<link rel="preconnect" href="https://unpkg.com">
<link rel="preconnect" href="https://cdn.jsdelivr.net">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<%-- defer so these don't block reaching each page's own AOS.init() call further down. --%>
<script defer src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script defer
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script defer
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
<link
	href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap"
	rel="stylesheet">

<!-- <link rel="stylesheet" type="text/css" href="css/style.css"> -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body, html {
	font-family: 'Google Sans', 'Open Sans', 'Sarabun', 'Noto Sans Thai',
		sans-serif !important;
	font-size: 16px;
	scroll-behavior: smooth;
	/* Full-bleed elements (width:100vw centered via left:50%+transform)
	   overshoot the real viewport by the scrollbar's width, which
	   otherwise adds a few px of page-wide horizontal scroll - see
	   home-services__bg-band. Clipping that sliver here is imperceptible
	   and standard for this pattern. */
	overflow-x: hidden;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Google Sans', 'Open Sans', 'Sarabun', 'Noto Sans Thai',
		sans-serif !important;
}

/* word-break:keep-all used to be set here to stop narrow headings from wrapping
   mid-word, but on Safari it also blocks overflow-wrap's emergency break for a
   fully unspaced Thai run - the line just overflows the viewport instead of
   wrapping at all. overflow-wrap:anywhere is the more reliable fallback across
   engines. text-wrap:pretty additionally avoids orphan last-line words where
   supported (Chromium only so far) - harmless no-op elsewhere, not a
   replacement for the .no-orphan hint below. */
h1, h2, h3, p {
	word-break: normal;
	overflow-wrap: anywhere;
	text-wrap: pretty;
}

/* Bootstrap defaults these to a blue box-shadow (and explicitly disables
   the outline it would otherwise replace); brand buttons without a .btn-*
   color variant fall back to the browser's native blue outline instead. */
.form-control:focus,
.page-link:focus,
.btn:focus, .btn.focus {
	border-color: #BD2125;
	box-shadow: 0 0 0 0.2rem rgba(189, 33, 37, 0.25);
}

a:focus, button:focus, input:focus, textarea:focus, select:focus {
	outline-color: #BD2125;
}

p {
	color: black;
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
	border-bottom: 4px solid !important;
	color: #BD2125 !important;
}

.currentPage {
	border-color: white white #BD2125 !important;
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
	z-index: 1030;
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

/* .detail { */
/* 	background-color: white; */
/* 	box-shadow: 0px 10px 20px -5px rgba(0, 0, 0, 0.75); */
/* 	margin-left: 10%; */
/* 	margin-right: 10%; */
/* 	margin-top: 10%; */
/* 	margin-bottom: 5%; */
/* 	padding-left: 5%; */
/* 	padding-right: 5%; */
/* 	padding-top: 5%; */
/* } */
@media screen and (max-width: 870px) {
	.vl {
		display: none;
	}
	/* 	.detail { */
	/* 		background-color: white; */
	/* 		box-shadow: 0px 10px 20px -5px rgba(0, 0, 0, 0.75); */
	/* 		margin-left: 2%; */
	/* 		margin-right: 2%; */
	/* 		margin-top: 15%; */
	/* 		margin-bottom: 1%; */
	/* 		padding-left: 5%; */
	/* 		padding-right: 5%; */
	/* 		padding-top: 5%; */
	/* 	} */
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
	background-color: #212121;
	text-align: center;
	padding-left: 10%;
	padding-right: 10%;
	width: 100%;
	height: 504px;
	padding: 50px 216px 50px 216px;
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
}

/* Ensure the dropdown menu doesn't disappear when hovering over it */
.nav-item .dropdown-menu {
	display: none; /* Hidden by default */
	position: absolute;
	top: 100%; /* Position below the button */
	min-width: 160px; /* Adjust width as needed */
	z-index: 1000; /* Ensure it appears above other content */
}

/* Add a smooth transition for better UX */
.nav-item.dropdown .dropdown-menu {
	transition: all 0.3s ease;
}

.dropdown-item {
	background-color: transparent !important;
	/* Removes the default background */
	color: black !important;
	/* Sets the text color to black or any other color you prefer */
}

.dropdown-item:hover {
	background-color: inherit !important;
	color: #BD2125 !important;
	border-color: white white #BD2125 !important;
	border-bottom: 4px solid !important;
}

.dropdown-item.active {
	border: none !important;
}

@media screen and (min-width: 870px) {
	.imgservices2 {
		
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

.breadcrumb {
	background-color: transparent !important;
}

/* footer.jsp's Bootstrap 5.3.0 CSS (needed there for its own data-bs-*
   collapse widgets) defines its own bare ".breadcrumb" too, using
   var(--bs-breadcrumb-padding-x/y) - same specificity as Bootstrap
   4.3.1's own ".breadcrumb" (already loaded above), and footer's is
   always the last one parsed, so its padding was winning on every page
   that uses .breadcrumb site-wide (blog/news, careers, services,
   contacts - both old and new). "html .breadcrumb" (element + class)
   beats a bare ".breadcrumb" from either version on specificity alone.
   Value below is Bootstrap 4's own default - this doesn't change how
   the site already looked, it just stops it flickering to Bootstrap
   5's slightly different one partway through a page load. */
html .breadcrumb {
	padding: 0.75rem 1rem;
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

a {
	color: inherit !important; /* ใช้สีเดียวกับพ่อแม่ขององค์ประกอบ */
	text-decoration: none; /* ถ้าต้องการลบเส้นใต้ด้วย */
}
</style>

<script>
	// Strips tracking/junk query params (fbclid, utm_*, etc.) but keeps "page" for blog.jsp's pagination.
	if (location.search) {
		var pageMatch = /(?:^|[?&])page=([^&]*)/.exec(location.search);
		var cleanUrl = location.pathname
				+ (pageMatch ? "?page=" + pageMatch[1] : "");
		if (cleanUrl !== location.pathname + location.search) {
			location.replace(cleanUrl);
		}
	}
</script>

</head>
<body>
	<div id="page-loading-bar" aria-hidden="true"></div>
	<%-- Only fires for real same-origin navigations - skips anchors, new tabs, downloads, and other origins. --%>
	<script>
		document.addEventListener('click', function(e) {
			var link = e.target.closest('a[href]');
			if (!link) {
				return;
			}
			var href = link.getAttribute('href');
			if (!href || href.charAt(0) === '#' || href.indexOf('javascript:') === 0
					|| href.indexOf('mailto:') === 0 || href.indexOf('tel:') === 0) {
				return;
			}
			if (link.target && link.target !== '_self') {
				return;
			}
			if (link.hasAttribute('download')) {
				return;
			}
			var url;
			try {
				url = new URL(href, window.location.href);
			} catch (err) {
				return;
			}
			if (url.origin !== window.location.origin) {
				return;
			}
			var bar = document.getElementById('page-loading-bar');
			bar.className = 'is-loading';
			// Forces the browser to paint the bar before navigation tears this page down.
			void bar.offsetWidth;
		});
	</script>
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NF235VW"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<tiles:insertAttribute name="header" ignore="true" />
	<tiles:insertAttribute name="body" ignore="true" />
	<tiles:insertAttribute name="partner" ignore="true" />
	<tiles:insertAttribute name="footer" ignore="true" />

	<script>
		// Glues the last space in .no-orphan elements with &nbsp; so a short
		// trailing token (e.g. "10 ปี") can't wrap onto its own line by itself.
		// Only works where a real space character exists in the text - Thai's
		// dictionary-based word breaks (no literal space) aren't touched by
		// this at all; those still need a manual nowrap span at that spot.
		document.querySelectorAll('.no-orphan').forEach(function(el) {
			el.innerHTML = el.innerHTML.replace(/\s+(\S+)\s*$/, '&nbsp;$1');
		});
	</script>
</body>
</html>