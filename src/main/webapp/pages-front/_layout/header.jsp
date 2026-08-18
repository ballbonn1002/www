<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- Same server-side active-state logic as redesign/_layout/header.jsp - see
     that file's comment for why requestURI is read here instead of relying
     on JS in each content page. Kept in both files since the redesign.enabled
     switch below can render either one. --%>
<c:set var="isHomeActive" value="${requestURI == '/'}" />
<c:set var="isServicesActive"
	value="${fn:contains(requestURI, '/services') or fn:contains(requestURI, '/software-development') or fn:contains(requestURI, '/it-outsource') or fn:contains(requestURI, '/mobile-app-development')}" />
<c:set var="isCareersActive"
	value="${fn:contains(requestURI, '/careers')}" />
<c:set var="isBlogActive" value="${fn:contains(requestURI, '/blog')}" />
<c:set var="isNewsActive" value="${fn:contains(requestURI, '/news')}" />
<c:set var="isContactsActive"
	value="${fn:contains(requestURI, '/contacts')}" />

<%-- whole-site redesign switch: swap the entire navbar markup based on the
     redesign.enabled config flag (see Constant.isRedesignEnabled()). jsp:include
     is used instead of jsp:forward because this file is itself included by
     Tiles - forwarding from inside an included fragment is invalid per
     servlet spec. --%>
<c:choose>
	<c:when test="${constant.redesignEnabled}">
		<jsp:include page="/pages-front/redesign/_layout/header.jsp" />
	</c:when>
	<c:otherwise>

		<script src="https://code.jquery.com/jquery-2.2.0.min.js"
			type="text/javascript"></script>
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
			integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
			crossorigin="anonymous">
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>

		<!-- Main Header -->
		<div class="header" style="margin-bottom: 10px !important">
			<div class="progress-container"></div>
			<div class="" id="myBar" sytle="padding-bottom:0px!important">
				<!--Navbar-->
				<nav
					class="navbar  navbar-expand-lg navbar-light bg-light fixed-top"
					style="padding-bottom: 0px !important; margin-bottom: 0px !important">
					<!-- Navbar brand -->
					<%-- width=175px (unquoted, invalid unit) never actually reserved
						 layout space - the width attribute only accepts a plain
						 integer. width/height below are the image's real 376x91
						 intrinsic ratio scaled to the same 175px display width, so
						 the browser can compute and reserve the right box before the
						 logo has even downloaded - this is the header, so it's the
						 first thing that would otherwise shift on every single page. --%>
					<a href="/"> <img width="175" height="42"
						src="/pages-front/img/logo/cubesofttech.png"
						alt="Responsive image">
					</a>
					<!-- Collapse button -->
					<button class="navbar-toggler second-button" type="button"
						data-toggle="collapse" data-target="#navbarSupportedContent23"
						aria-controls="navbarSupportedContent23" aria-expanded="false"
						aria-label="Toggle navigation">
						<div class="animated-icon2">
							<div class="container">
								<div class="bar"></div>
								<div class="bar"></div>
								<div class="bar"></div>
							</div>
						</div>
					</button>
					<!-- Collapsible content -->



					<div align="right" class="collapse navbar-collapse text-right"
						id="navbarSupportedContent23">
						<!-- Links -->
						<div class="collapse navbar-collapse  navbar-right "
							style="padding-bottom: 0px !important" id="navbarTogglerDemo02">
						</div>

						<ul class="navbar-nav mr-auto ">
							<li class=""><b><a
									class="nav-link ${isHomeActive ? 'active' : ''}"
									id="navbar-hover" href="/"
									style="padding-left: 30px; padding-right: 30px; color: black">Home</a></b>
							</li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle ${isServicesActive ? 'active' : ''}"
								href="/services" id="navbar-hover" role="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								style="padding-left: 30px; padding-right: 30px; color: black; font-weight: bold;">
									Services </a>
								<div class="dropdown-menu" aria-labelledby="navbar-hover">
									<a class="dropdown-item " href="/services">Services</a> <a
										class="dropdown-item" href="/software-development">Software
										Development</a> <a class="dropdown-item" href="/it-outsource">IT
										Outsource</a> <a class="dropdown-item"
										href="/mobile-app-development">Mobile App Development</a>
								</div></li>
							<li class=""><b> <a
									class="nav-link ${isCareersActive ? 'active' : ''}"
									id="navbar-hover" href="/careers"
									style="padding-left: 30px; padding-right: 30px; color: black">Careers</a></b>
							</li>

							<!---เมนู article   -->
							<li class=""><b> <a
									class="nav-link ${isBlogActive ? 'active' : ''}"
									id="navbar-hover" href="/blog"
									style="padding-left: 30px; padding-right: 30px; color: black">Blog</a></b>
							</li>
							<li class=""><b> <a
									class="nav-link ${isNewsActive ? 'active' : ''}"
									id="navbar-hover" href="/news"
									style="padding-left: 30px; padding-right: 30px; color: black">News</a></b>
							</li>
							<li class=""><b> <a
									class="nav-link ${isContactsActive ? 'active' : ''}"
									id="navbar-hover" href="/contacts"
									style="padding-left: 30px; padding-right: 30px; color: black">Contacts</a></b>
							</li>

						</ul>
						<!-- Links -->
					</div>
					<!-- Collapsible content -->
				</nav>
			</div>

		</div>
		<!--/.Navbar-->
		<button class="btn btn-sm" onclick="topFunction()" id="myBtn"
			title="Go to top">
			<i class="fas fa-arrow-up"
				style="font-size: 26px; text-align: center;"></i>
		</button>

		<style>
#myBtn {
	padding: 10px;
}

@media ( max-width : 767px) {
	#myBtn {
		padding: 5px;
		font-size: 12px;
	}
	#myIcon {
		font-size: 18px;
	}
}

/* Dropdown Menu */
.dropdown-menu {
	display: none; /* Hide by default */
	position: absolute; /* Position below the button */
	top: 100%; /* Position below the button */
	left: 0; /* Align to the left of the button */
	min-width: 160px; /* Set a minimum width */
	z-index: 1000; /* Ensure it appears above other content */
}

/* Show dropdown on click */
.nav-item.show .dropdown-menu {
	display: block;
}

/* Ensure dropdown menu is properly positioned on smaller screens */
@media ( max-width : 767px) {
	.dropdown-menu {
		position: static;
		/* Make dropdown menu appear in normal flow on small screens */
		margin-top: 0; /* Adjust margin for small screens */
	}
}

/* Optional: Adjust for larger screens if needed */
@media ( min-width : 768px) {
	.dropdown-menu {
		top: 100%; /* Adjust position if necessary */
	}
}
</style>

		<script type="text/javascript">
			$(document).ready(function() {
				// Handle dropdown toggle on click
				$('.dropdown-toggle').on('click', function(event) {
					event.preventDefault();
					$(this).next('.dropdown-menu').toggle();
				});

				// Handle navbar toggling on small screens
				$('.navbar-toggler').on('click', function() {
					var target = $(this).data('target');
					$(target).collapse('toggle');
				});

				// Prevent closing when clicking inside the navbar
				$('.navbar').on('click', function(event) {
					event.stopPropagation();
				});

				// Close dropdowns and navbar when clicking outside
				$(document).on('click', function(event) {
					if (!$(event.target).closest('.navbar').length) {
						$('.dropdown-menu').hide();
						$('.navbar-collapse').collapse('hide'); // Hide the navbar when clicking outside
					}
				});
			});
		</script>

	</c:otherwise>
</c:choose>
<!-- endmenu -->

