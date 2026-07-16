<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--
	Nav active-state is decided here, server-side, at render time - not by
	JS in every content page after the fact. requestURI is a request
	attribute every Action already sets (BlogAction, ServicesAction,
	CareersAction, ContactsAction, HomeAction - see RewriteFilter.getRequestURI),
	so this reads it rather than creating a new source of truth or reaching
	into pageContext.request directly.

	Each condition is computed once here and reused below, instead of
	inlining the same fn:contains(...) expression at every nav-link - the
	Services dropdown in particular needs the same "is any of my 4 paths
	current" check on both its parent link and (implicitly) its children.
--%>
<c:set var="isHomeActive" value="${requestURI == '/'}" />
<c:set var="isServicesActive"
	value="${fn:contains(requestURI, '/services') or fn:contains(requestURI, '/software-development') or fn:contains(requestURI, '/it-outsource') or fn:contains(requestURI, '/mobile-app-development')}" />
<c:set var="isCareersActive" value="${fn:contains(requestURI, '/careers')}" />
<c:set var="isBlogActive" value="${fn:contains(requestURI, '/blog')}" />
<c:set var="isNewsActive" value="${fn:contains(requestURI, '/news')}" />
<c:set var="isContactsActive" value="${fn:contains(requestURI, '/contacts')}" />

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
		<nav class="navbar  navbar-expand-lg navbar-light bg-light fixed-top"
			style="padding-bottom: 0px !important; margin-bottom: 0px !important;">
			<!-- Navbar brand -->
			<a href="/"> <img width=175px
				src="/pages-front/img/logo/cubesofttech.png" alt="Responsive image">
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

			<div class="collapse navbar-collapse justify-content-center"
				id="navbarSupportedContent23">
				<!-- Links -->
				<div class="collapse navbar-collapse  navbar-right "
					style="padding-bottom: 0px !important" id="navbarTogglerDemo02">
				</div>

				<div class="navbar-menu-frame">
				<ul class="navbar-nav">
					<li class=""><b><a
							class="nav-link ${isHomeActive ? 'active' : ''}"
							id="navbar-hover" href="/"
							style="padding-left: 30px; padding-right: 30px; color: black">Home</a></b>
					</li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle ${isServicesActive ? 'active' : ''}"
						href="/services" id="navbar-hover" role="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
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
							class="nav-link ${isBlogActive ? 'active' : ''}" id="navbar-hover"
							href="/blog"
							style="padding-left: 30px; padding-right: 30px; color: black">Blog</a></b></li>
					<li class=""><b> <a
							class="nav-link ${isNewsActive ? 'active' : ''}" id="navbar-hover"
							href="/news"
							style="padding-left: 30px; padding-right: 30px; color: black">News</a></b>
					</li>
					<li class=""><b> <a
							class="nav-link ${isContactsActive ? 'active' : ''}"
							id="navbar-hover" href="/contacts"
							style="padding-left: 30px; padding-right: 30px; color: black">Contacts</a></b>
					</li>

				</ul>
				</div>
				<!-- Links -->
			</div>
			<!-- Collapsible content -->
		</nav>
	</div>

</div>
<!--/.Navbar-->
<button class="btn btn-sm" onclick="topFunction()" id="myBtn"
	title="Go to top">
	<i class="fas fa-arrow-up" style="font-size: 26px; text-align: center;"></i>
</button>
<!-- redesignToggleBtn is rendered unconditionally by the original
     pages-front/_layout/header.jsp, not duplicated here -->

<style>
.navbar {
	min-height: 70px;
}

.navbar-menu-frame {
	display: flex;
	align-items: center;
	justify-content: center;
/* 	border: 3px solid red; */
	border-radius: 30px;
	padding: 6px 20px;
	margin: 8px auto;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
}

/* .navbar uses justify-content:space-between (Bootstrap default), so the
   frame only centers in the leftover space next to the logo, not the true
   middle of the bar. Pull it out of flow and center on the whole navbar
   width instead - desktop only, so mobile's collapse/stack behavior is untouched. */
@media (min-width: 992px) {
	.navbar-menu-frame {
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		margin: 0;
	}
}

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
