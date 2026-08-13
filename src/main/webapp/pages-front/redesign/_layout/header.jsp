<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--
	Nav active-state computed once here from requestURI (set by every
	Action - see RewriteFilter.getRequestURI) and reused below, rather
	than repeating fn:contains(...) at each nav-link.
--%>
<c:set var="isHomeActive" value="${requestURI == '/'}" />
<c:set var="isServicesActive"
	value="${fn:contains(requestURI, '/services') or fn:contains(requestURI, '/software-development') or fn:contains(requestURI, '/it-outsource') or fn:contains(requestURI, '/mobile-app-development')}" />
<c:set var="isCareersActive" value="${fn:contains(requestURI, '/careers')}" />
<c:set var="isBlogActive" value="${fn:contains(requestURI, '/blog')}" />
<c:set var="isNewsActive" value="${fn:contains(requestURI, '/news')}" />
<c:set var="isContactsActive" value="${fn:contains(requestURI, '/contacts')}" />

<%-- baseLayout.jsp already loads jQuery/Bootstrap deferred; don't re-load them here. --%>

<!-- Main Header -->
<div class="header" style="margin-bottom: 10px !important">
	<div class="progress-container"></div>
	<div class="" id="myBar" sytle="padding-bottom:0px!important">
		<!--Navbar-->
		<nav class="navbar  navbar-expand-lg navbar-light fixed-top"
			style="padding-bottom: 0px !important; margin-bottom: 0px !important;">
			<!-- Navbar brand -->
			<%-- Same fix as the legacy header - width=175px (unquoted, invalid
				 unit) never reserved layout space; width/height below are the
				 image's real 376x91 ratio scaled to the same 175px display width. --%>
			<a href="/"> <img width="175" height="42"
				src="/pages-front/img/logo/cubesofttech.png" alt="Responsive image">
			</a>
			<!-- Collapse button -->
			<button class="navbar-toggler second-button" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent23"
				aria-controls="navbarSupportedContent23" aria-expanded="false"
				aria-label="Toggle navigation">
				<div class="animated-icon2">
					<div class="animated-icon2__bars">
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

<style>
/* --navbar-offset: total space the fixed navbar occupies (min-height +
   this .header div's margin-bottom) - the amount every redesign page's
   top-level wrapper should clear. Defined once here (header.jsp owns the
   navbar height) since other stylesheets can reference var(--navbar-offset)
   regardless of load order. Change this one value if the navbar height
   changes, instead of the fixed-pixel guesses pages used before. */
:root {
	--navbar-offset: 50px;
}

.navbar {
	min-height: 70px;
}

/* footer.jsp also loads Bootstrap 5 CSS (for its collapse widgets), whose
   .navbar padding rule was overriding Bootstrap 4's here once it loaded -
   same specificity, later wins. Fixed with a more specific selector
   instead of !important, so this wins regardless of load order. */
nav.navbar.fixed-top {
	padding: 0.5rem 1rem;
	background-color: transparent;
	box-shadow: none;
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

nav.navbar.fixed-top.is-scrolled {
	background-color: #FFFFFF;
	box-shadow: 0 2px 16px rgba(0, 0, 0, 0.08);
}

/* aria-expanded (already toggled by Bootstrap's collapse plugin on click)
   alone drives the X-morph below - no extra JS/class needed. */
.navbar-toggler.second-button {
	width: 44px;
	height: 44px;
	padding: 0;
	border: none;
	border-radius: 8px;
	transition: background-color 0.2s ease;
}

/* Matches Bootstrap's .navbar-expand-lg .navbar-toggler {display:none}
   breakpoint, so this only sets display when actually visible. */
@media (max-width: 991px) {
	.navbar-toggler.second-button {
		display: flex;
		align-items: center;
		justify-content: center;
	}
}

.navbar-toggler.second-button:hover {
	background-color: rgba(0, 0, 0, 0.06);
}

.navbar-toggler.second-button:focus {
	outline: none;
	box-shadow: 0 0 0 3px rgba(189, 33, 37, 0.25);
}

.animated-icon2 {
	width: 26px;
	height: 20px;
	position: relative;
}

.animated-icon2__bars {
	position: absolute;
	inset: 0;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.animated-icon2__bars .bar {
	width: 100%;
	height: 3px;
	margin: 0;
	border-radius: 2px;
	background-color: #BD2125;
	transition: transform 0.3s ease, opacity 0.3s ease;
}

.navbar-toggler[aria-expanded="true"] .animated-icon2__bars .bar:nth-child(1) {
	transform: translateY(8.5px) rotate(45deg);
}

.navbar-toggler[aria-expanded="true"] .animated-icon2__bars .bar:nth-child(2) {
	opacity: 0;
}

.navbar-toggler[aria-expanded="true"] .animated-icon2__bars .bar:nth-child(3) {
	transform: translateY(-8.5px) rotate(-45deg);
}

.navbar-menu-frame {
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 30px;
	padding: 6px 20px;
	margin: 8px auto;
	background-color: rgba(255, 255, 255, 0.35);
	border: 1px solid rgba(255, 255, 255, 0.5);
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
	backdrop-filter: blur(14px);
	-webkit-backdrop-filter: blur(14px);
	transition: background-color 0.3s ease, border-color 0.3s ease;
}

nav.navbar.fixed-top.is-scrolled .navbar-menu-frame {
	background-color: #FFFFFF;
	border-color: rgba(0, 0, 0, 0.06);
	backdrop-filter: none;
	-webkit-backdrop-filter: none;
}

/* Same glass trick as desktop, but less see-through - below the collapse
   breakpoint this expands into a full panel over page content, where
   desktop's lower alpha would be illegible. */
@media (max-width: 991px) {
	.navbar-menu-frame {
		background-color: rgba(255, 255, 255, 0.85);
	}
}

/* justify-content:space-between only centers the frame in the leftover
   space next to the logo, not the bar's true middle - pull out of flow
   and center on the full width instead (desktop only). */
@media (min-width: 992px) {
	.navbar-menu-frame {
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		margin: 0;
	}
}

/* Centering on the full navbar width means the frame's own width decides how
   close it comes to the logo - each link's inline 30px/30px padding makes it
   wide enough to overlap the logo from 992px up to ~1120px. Inline styles
   need !important to override. */
@media (min-width: 992px) and (max-width: 1150px) {
	.navbar-menu-frame .nav-link {
		padding-left: 14px !important;
		padding-right: 14px !important;
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

/* .navbar prefix (not bare .dropdown-menu) for the same reason as
   nav.navbar.fixed-top above - footer.jsp's Bootstrap 5 CSS defines
   its own bare .dropdown-menu, same specificity, later wins. */
.navbar .dropdown-menu {
	display: none; /* Hide by default */
	position: absolute; /* Position below the button */
	top: 100%; /* Position below the button */
	left: 0; /* Align to the left of the button */
	min-width: 230px; /* Set a minimum width */
	z-index: 1000; /* Ensure it appears above other content */
	margin-top: 8px;
	padding: 8px;
	border: 1px solid rgba(0, 0, 0, 0.06);
	border-radius: 14px;
	background-color: #FFFFFF;
	box-shadow: 0 12px 32px rgba(0, 0, 0, 0.12);
}

/* Show dropdown on click */
.nav-item.show .dropdown-menu {
	display: block;
}

/* Ensure dropdown menu is properly positioned on smaller screens */
@media ( max-width : 767px) {
	.navbar .dropdown-menu {
		position: static;
		/* Make dropdown menu appear in normal flow on small screens */
		margin-top: 0; /* Adjust margin for small screens */
	}
}

/* Optional: Adjust for larger screens if needed */
@media ( min-width : 768px) {
	.navbar .dropdown-menu {
		top: 100%; /* Adjust position if necessary */
	}
}
</style>

<script type="text/javascript">
	// DOMContentLoaded, not $(document).ready() - jQuery loads deferred
	// from baseLayout.jsp, so $ isn't guaranteed to exist any earlier.
	document.addEventListener('DOMContentLoaded', function() {
		// Solid navbar once the visitor scrolls past the top - blended/glass
		// at rest so it can sit over a hero background, plain white with a
		// shadow past that so it stays readable over regular page content.
		var navbarEl = document.querySelector('nav.navbar.fixed-top');
		function updateNavbarScrollState() {
			navbarEl.classList.toggle('is-scrolled', window.scrollY > 60);
		}
		window.addEventListener('scroll', updateNavbarScrollState);
		updateNavbarScrollState();

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
	});
</script>
