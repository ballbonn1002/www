<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!-- Main Header -->
<div class="header" style="padding-bottom: 10px !important">
	<div class="progress-container"></div>
	<div class="" id="myBar" sytle="padding-bottom:0px!important">
		<!--Navbar-->
		<nav class="navbar  navbar-expand-lg navbar-light bg-light fixed-top"
			style="padding-bottom: 0px !important; margin-bottom: 0px !important">
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



			<div align="right" class="collapse navbar-collapse text-right"
				id="navbarSupportedContent23">
				<!-- Links -->
				<div class="collapse navbar-collapse  navbar-right "
					style="padding-bottom: 0px !important" id="navbarTogglerDemo02">
				</div>

				<ul class="navbar-nav mr-auto ">
					<li class=""><b><a class="nav-link " id="navbar-hover"
							href="/"
							style="padding-left: 30px; padding-right: 30px; color: black">Home</a></b>
					</li>
					<!---เมนู out team กับ intership
                        <li class="">
                    <div class="dropdown show">
                        <a class="nav-link dropdown-toggle" id="navbar-hover" href="#"style="padding-left: 30px;padding-right: 30px; color:black" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <b> About US</b>
                        </a>
                        <div class="dropdown-menu menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-i" id="navbar-hover" href="#"> <b>Our Story </b></a>
                            <a class="dropdown-i" id="navbar-hover" href="ourteam.php"> <b>Our Team </b></a>
                            <a class="dropdown-i" id="navbar-hover" href="internship.php"> <b>Internship Programe </b></a>
                       </div>
                      </div>
                        </li>
--->
					<!-- 
					<li class=""><b> <a class="nav-link " id="navbar-hover"
							href="services.php"
							style="padding-left: 30px; padding-right: 30px; color: black">Services</a></b>
					</li>
					<li class=""><b> <a class="nav-link" id="navbar-hover"
							href="job.php"
							style="padding-left: 30px; padding-right: 30px; color: black">Careers</a></b>
					</li>
					-->
					<!---เมนู article   -->
					<!-- 
					<li class=""><b> <a class="nav-link" id="navbar-hover"
							href="articleAll.php"
							style="padding-left: 30px; padding-right: 30px; color: black">Blog</a></b>
					</li>
					<li class=""><b> <a class="nav-link" id="navbar-hover"
							href="contact.php"
							style="padding-left: 30px; padding-right: 30px; color: black">Contacts</a></b>
					</li>
-->
					<li class="nav-item dropdown">
    					<a class="nav-link dropdown-toggle" href="/services" id="navbar-hover" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-left: 30px; padding-right: 30px; color: black; font-weight: bold;">
        					Services
    					</a>
    					<div class="dropdown-menu" aria-labelledby="navbar-hover">
        				<a class="dropdown-item " href="/services">Services</a>
        				<a class="dropdown-item" href="/software-development">Software Development</a>
        				<a class="dropdown-item" href="/it-outsource">IT Outsource</a>
        				<a class="dropdown-item" href="/mobile-app-development">Mobile App Development</a>
    					</div>
					</li>



					<li class=""><b> <a class="nav-link" id="navbar-hover"
							href="/careers"
							style="padding-left: 30px; padding-right: 30px; color: black">Careers</a></b>
					</li>

					<!---เมนู article   -->
					<li class=""><b> <a class="nav-link" id="navbar-hover"
							href="/blog"
							style="padding-left: 30px; padding-right: 30px; color: black">Blog</a></b>
					</li>
					<li class=""><b> <a class="nav-link" id="navbar-hover"
							href="/news"
							style="padding-left: 30px; padding-right: 30px; color: black">News</a></b>
					</li>
					<li class=""><b> <a class="nav-link" id="navbar-hover"
							href="/contacts"
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
	<i class="fa fa-arrow-up" style="font-size: 26px;"></i>
</button>
<!-- endmenu -->

<style>
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
@media (max-width: 767px) {
    .dropdown-menu {
        position: static; /* Make dropdown menu appear in normal flow on small screens */
        margin-top: 0; /* Adjust margin for small screens */
    }
}

/* Optional: Adjust for larger screens if needed */
@media (min-width: 768px) {
    .dropdown-menu {
        top: 100%; /* Adjust position if necessary */
    }
}
</style>

<script type="text/javascript">
$(document).ready(function () {
    // Handle dropdown toggle on click
    $('.dropdown-toggle').on('click', function (event) {
        event.preventDefault();
        $(this).next('.dropdown-menu').toggle();
    });

    // Handle navbar toggling on small screens
    $('.navbar-toggler').on('click', function () {
        var target = $(this).data('target');
        $(target).collapse('toggle');
    });

    // Prevent closing when clicking inside the navbar
    $('.navbar').on('click', function (event) {
        event.stopPropagation();
    });

    // Close dropdowns and navbar when clicking outside
    $(document).on('click', function (event) {
        if (!$(event.target).closest('.navbar').length) {
            $('.dropdown-menu').hide();
            $('.navbar-collapse').collapse('hide'); // Hide the navbar when clicking outside
        }
    });
});


</script>
