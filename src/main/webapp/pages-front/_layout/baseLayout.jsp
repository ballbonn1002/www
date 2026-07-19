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
<%--
	Critical inline CSS - deliberately the very first thing in <head>,
	before any <link>/<script>, so the very first paint already matches the
	site's real background (#F5F5F5) instead of the browser's white
	default. Every page's own <style> block re-declares this same color
	further down (duplicated, not shared - see blog.jsp/contacts.jsp etc.),
	so this doesn't replace those, it just closes the gap between "browser
	has nothing to paint yet" and "that per-page <style> has been parsed".
--%>
<style>
html{background-color:#F5F5F5;}
/* Top loading bar - #page-loading-bar (div right after <body>) + the
   click listener further down toggle .is-loading on it. Sits fixed at
   z-index above everything so a visitor sees "something is happening"
   the instant they click an internal link, instead of nothing until the
   new document starts painting. Never explicitly hidden again after a
   click - the whole document gets replaced by the incoming navigation,
   so there's nothing to reset once that happens. */
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

/* Cross-document View Transitions - the <meta name="view-transition"
   content="same-origin"> tag this replaced was an early-draft syntax the
   spec dropped before ever shipping in a browser; a browser that doesn't
   recognize a meta tag's name just ignores it silently (no console
   warning, no error), which is exactly why it sat here doing nothing
   without anyone noticing. @view-transition is the actual CSS Working
   Draft syntax (shipped in Chrome/Edge 126+) - progressive enhancement
   only, unsupported browsers skip the whole at-rule the same silent way.
   Both the origin and destination page of a navigation need this rule
   present for the transition to run, which this already satisfies since
   baseLayout.jsp is the one <head> every page shares.
   Wrapped in prefers-reduced-motion so it's off entirely for anyone who's
   asked their OS for less motion, rather than just visually thinning it
   out - confirmed against Chrome's own documented pattern for this exact
   case, since @media nesting an at-rule like this is otherwise unusual. */
@media (prefers-reduced-motion: no-preference) {
	@view-transition {
		navigation: auto;
	}
}
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
	<%--
		blog.css itself is <link>'d from inside blog.jsp (a Tiles "body"
		fragment - no <head> of its own to put it in), which the parser
		doesn't reach until after everything else in <head> plus the whole
		header tile have already been fetched/painted. Preloading it here
		starts that fetch in parallel with every other <head> resource
		instead, so by the time the parser reaches the real <link
		rel="stylesheet"> down in the body, the file is very likely already
		in cache and applies close to instantly. Same pageBaseUri guard as
		the rel=prev/next links above - only true on the redesign blog/news
		listing page, the one page that actually links this file.
	--%>
	<link rel="preload" as="style"
		href="/pages-front/redesign/assets/css/blog.css">
</c:if>
<%--
	Hero image preload for the blog/news "แนะนำล่าสุด" article-preview
	section - newBlog is only ever set by BlogAction.init() (the blog/news
	listing pages), same guard pattern as pageBaseUri above, so this is a
	no-op (empty output) on every other page on the site, not just visually
	scoped but literally absent from those pages' HTML. Struts2 runs the
	Action to completion before Tiles renders this <head> at all, so
	newBlog/constant are already on the request by the time this line runs
	- no ordering problem to work around. path comes from the exact same
	${newBlog.path} the <img> itself uses further down in blog.jsp, rather
	than a second hardcoded copy, so the two can never drift apart if a
	newer article becomes the featured one.
--%>
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

<%--
	preconnect for every external origin this head fetches a stylesheet or
	blocking/deferred script from. Without these, each CDN pays its own
	DNS+TLS handshake only once the browser's HTML parser actually reaches
	that <link>/<script> tag, so they land staggered instead of roughly
	together - that staggered arrival is what shows up as "CSS trickling
	in", each one's rules snapping on and reflowing the page a beat after
	the last. crossorigin is only added where the real fetch below also
	uses crossorigin (the SRI/integrity-checked ones) - adding it to a
	plain, non-CORS fetch would open the wrong connection type and the
	browser would just open a second one for the real request anyway.
	Consolidated here - previously this was two separate, byte-identical
	duplicate preconnect pairs further down for fonts.googleapis.com/
	fonts.gstatic.com only, and no hint at all for any other origin below.
--%>
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
<%--
	defer on all three - none had it before, which meant the browser had to
	fully fetch+parse+execute jQuery, then Popper, then Bootstrap.js, all
	before it could even start building the rest of the page, let alone
	reach the AOS.init() call further down each page (that delay is what
	turned a plain white-flash into "everything AOS hid at opacity:0 pops
	in at once" - see the fade-in/scroll-reveal findings for those pages).
	defer preserves their relative execution order (still jQuery, then
	Popper, then Bootstrap.js, each after the previous finishes) and runs
	them after HTML parsing completes but before DOMContentLoaded - safe
	here because every page's own jQuery-dependent code on this site is
	already wrapped in $(document).ready(...), which by definition doesn't
	run until after that same point anyway.
--%>
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
	font-size: 15px;
	scroll-behavior: smooth;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Google Sans', 'Open Sans', 'Sarabun', 'Noto Sans Thai',
		sans-serif !important;
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
	// Strips tracking/junk query params (fbclid, utm_*, etc.) off every
	// page load, but keeps "page" - blog.jsp's pagination depends on
	// ?page=N surviving this, unlike every other param this was written
	// to clean up. Only replace()s when the URL actually needs trimming,
	// so an already-clean "?page=2" doesn't get an extra, pointless
	// history entry every load.
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
	<%--
		Inline and this early deliberately - needs to be registered before
		the visitor can click anything. Only triggers for a real same-origin
		page navigation: skips #anchors, javascript:/mailto:/tel: links,
		target!=_self links (new tab), download links, and any link to
		another origin (those aren't "this site loading", nothing to show a
		bar for). No corresponding "hide" call anywhere - once a real
		navigation starts, this whole document (bar included) is on its way
		out, so there's nothing left to reset.
	--%>
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
			// Forces the browser to commit the style change (and get a
			// paint in) before this handler returns and the actual
			// navigation proceeds - on a fast/local response, the new
			// page could otherwise start tearing this one down before
			// the bar ever painted a single visible frame. Reading a
			// layout property is what forces that commit; the value
			// itself isn't used for anything.
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
</body>
</html>