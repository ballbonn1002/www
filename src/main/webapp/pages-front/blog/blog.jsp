<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Cube SoftTech.Co., Ltd.",
      "item": "${constant.webPath}/"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Cube SoftTech Blog",
      "item": "${constant.webPath}/blog"
    }
  ]
}
</script>

<style>

#navbar-hover:hover {
	color: #BD2125 !important;
	text-decoration: none;
	border-color: white white #BD2125 !important;
	border-bottom: 4px solid;
}

.parallax {
    /* The image used */
    background-image: url("https://images.unsplash.com/photo-1476242906366-d8eb64c2f661?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1908&q=80");

    /* Set a specific height */
    min-height: 500px;

    /* Create the parallax scrolling effect */
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
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


.icon {
	width: 90px;
	height: 75px;
}

.bar {
	width: 30px;
	height: 3px;
	background-color: #333;
	margin: 6px 0;
	transition: 0.4s;
}

.vl {
	border-left: 2px solid rgb(233, 233, 233);
	height: 140px;
}

@media screen and (max-width: 870px) {
	.vl {
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

.articleblockbg {
	background-color: #F5F5F5;
	padding-top: 1%;
	padding-bottom: 5%;
	padding-left: 10%;
	padding-right: 10%;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
	margin-bottom: 5%;
	margin-top: 0%;
}

.articleblockbg2 {
	padding-top: 5%;
	padding-bottom: 3%;
	padding-left: 3%;
	padding-right: 3%;
}

.articleblockbg2:hover {
	color: #BD2125;
}

.articleblockbg3 {
	transition: transform .2s;
	/* Animation */
}

.articleblockbg3:hover {
	transform: scale(1.05);
}

hr.new {
	border-top: 2px solid lightgray;
	padding-right: 10%;
	margin: 0 0 0;
}

a {
	color: #000;
}

.ardetail {
	padding-top: 5%;
	padding-bottom: 5%;
	padding-left: 5%;
	padding-right: 5%;
	background-color: white;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
}

.ardetail1 {
	padding-top: 5%;
	padding-bottom: 5%;
	padding-left: 5%;
	padding-right: 5%;
	height: 400px;
	white-space: normal;
	text-overflow: ellipsis;
	overflow: hidden;
}

.aum {
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	-ms-text-overflow: ellipsis;
	overflow: hidden;
	width: 100%;
	font-size: 20px;
	color: #BD2125;
	font-weight: bold;
}

.aum1 {
	width: 100%;
	font-size: 25px;
	color: #000;
	font-weight: bold;
}

.logojob {
	padding-bottom: 50px;
	padding-top: 100px;
}


.btn-right {
	position: absolute;
	bottom: 0;
	right: 0;
}

.btn-danger {
	color: #fff;
	background-color: #dc3545;
	border-color: #dc3545;
}

.btn-lg {
	display: inline-block;
	padding: 0.5rem 1rem;
	font-size: 1.25rem;
	line-height: 1.5;
	border-radius: 0.3rem;
}

.col-lg-6 {
	-ms-flex: 0 0 50%;
	flex: 0 0 50%;
	max-width: 50%;
	height: 500px;
}
</style>


<!--------------------------home------------------------------------>
<div class="parallax show-on-scroll">
	<br>
	<div align="center" class="logojob" data-aos="fade-down"
		data-aos-duration="800">	
		<c:if test="${fn:contains(requestURI, 'blog')}"><div class="job-block font-weight-bolder">Blog</div></c:if>
		<c:if test="${fn:contains(requestURI, 'news')}"><div class="job-block font-weight-bolder">News</div></c:if>
		
		<br> <font size="5px">Professional IT People ~ Innovative
			IT Solutions<br>
		</font> <font size="3px">IT Staff Outsourcing Services | IT
			consultants | Custom Software Solutions</font>

	</div>
	<div class="articleblockbg">
		<div>
			<ul class="breadcrumb">
				<li><a href="/">Home</a>&nbsp;/&nbsp;</li>
				<li><a class="currentPage" id="model">
					<c:if test="${fn:contains(requestURI, 'blog')}">Blog</c:if>
					<c:if test="${fn:contains(requestURI, 'news')}">News</c:if></a></li>
			</ul>
		</div>
		<div id="articledetail1">
			<div class="row articleblockbg2">
				<div class="col-lg-6">
					<div class="articleblockbg3">
						<a class="" href="${newBlog.page_uri_id}"
							role="button"> <img src="${constant.imgContext}/${newBlog.path}" width="100%"
							height="500px"
							style="object-fit: cover; border-radius: 20px 20px 20px 20px">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<left>
					<div class="ardetail1">
						<div class="aum1">${newBlog.topic}</div>
						<a href="${newBlog.page_uri_id}"
							class="btn btn-danger btn-lg btn-right" role="button">Read
							More</a> <br>
						<div class="xdj266r x11i5rnm xat24cr x1mh8g0r x1vvkbs x126k92a"
							style="margin: 0px; overflow-wrap: break-word; animation-name: none !important; transition-property: none !important; box-sizing: inherit;">
							${newBlog.detail}</div>
					</div>
					</left>
				</div>
			</div>
		</div>
		<div class="row" id="articledetail">
			<%-- start loop with index 1 becuase index 0 is main blog --%>
			<c:forEach var="blog" items="${blogList}" varStatus="Count" begin="1">
				
				<div class='col-lg-4 articleblockbg2'>
					<left>
					<div class='articleblockbg3'>
						<a href='${blog.page_uri_id}' role='button'>
							<img src='${constant.imgContext}${blog.path}' width='100%' height='250px'
							style='object-fit: cover;'>
						</a>
					</div>
					<div class='ardetail'>
						<div class='aum'>${blog.topic}</div>
					</div>
					</left>
				</div>
				
			</c:forEach>
		</div>
	</div>

	<br>
</div>


<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	AOS.init();

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