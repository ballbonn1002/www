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

<%--
	jQuery/Bootstrap Icons/Bootstrap CSS+JS were all being loaded a second
	time right here - baseLayout.jsp's <head> (shared by every page,
	rendered before this "header" tile) already provides all four: same
	Bootstrap 4.3.1 CSS/JS (byte-identical CDN URL + integrity hash), a
	newer Bootstrap Icons (1.11.3 vs this copy's 1.10.5), and jQuery
	(3.3.1 slim vs this copy's 2.2.0 - two different versions of jQuery
	on the same page). None had defer/async, so all four were blocking
	the parser for a completely redundant download on every single page
	load. Removed - the script below now relies on baseLayout's copies,
	wrapped in DOMContentLoaded since those load with defer (deferred
	scripts finish before DOMContentLoaded fires, so $ and .collapse()
	are guaranteed ready by then; they're not necessarily ready yet at
	the point this tile is parsed, since defer runs after parsing, not
	inline where the tag sits).
--%>

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
/* --navbar-offset: total space the fixed navbar actually occupies
   (min-height below + this .header div's own margin-bottom:10px,
   set inline further up this file) - the one number every redesign
   page's own top-level wrapper should clear so the navbar (fixed,
   z-index above content) never covers it. Defined once here since
   header.jsp is the file that actually owns the navbar's height -
   CSS custom properties resolve at paint time, not file-load-order
   time, so any other stylesheet on the page (blog.css, contacts.jsp's
   own <style>, future pages) can reference var(--navbar-offset)
   safely regardless of whether this file's <style> block happens to
   load before or after theirs.
   Previously every page guessed its own fixed pixel value instead
   (blog.jsp/contacts.jsp both independently landed on the same
   under-shooting 32px) - change this one value here if the navbar's
   real height ever changes, instead of hunting through every page. */
:root {
	--navbar-offset: 50px;
}

.navbar {
	min-height: 70px;
}

/* footer.jsp loads Bootstrap 5.3.0's CSS (needed there for its own
   data-bs-* collapse widgets - can't remove it, see the comment further
   down near that <link>). A stylesheet applies to the whole document
   regardless of where in the page its own <link> physically sits, so
   Bootstrap 5's own ".navbar { padding: var(--bs-navbar-padding-x) }"
   rule was overriding Bootstrap 4's ".navbar { padding: .5rem 1rem }"
   here too, the moment footer's CSS finished loading - same specificity
   (single class), later one in the cascade wins. Fixed with a more
   specific selector instead of !important, so it wins on specificity
   regardless of load order or which Bootstrap version loads last. */
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

/* Dropdown Menu - .navbar prefix on every rule here (not bare
   .dropdown-menu) for the same reason as nav.navbar.fixed-top above:
   footer.jsp's Bootstrap 5 CSS defines its own bare ".dropdown-menu"
   too, same specificity, and would win once it loads since it comes
   later in the document. */
.navbar .dropdown-menu {
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
	// DOMContentLoaded, not $(document).ready() directly - $ isn't
	// guaranteed to exist yet at this point (jQuery now only loads once,
	// deferred, from baseLayout.jsp - see the removed duplicate above).
	// Deferred scripts always finish before DOMContentLoaded fires, so by
	// the time this callback runs, $ and the .collapse() plugin are both
	// ready.
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
