<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="../pages-front/articleAll_files/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript" async=""
	src="../pages-front/articleAll_files/analytics.js.download"></script>
<script type="text/javascript" async="" src="../pages-front/articleAll_files/js"></script>
<script type="text/javascript" async="" src="../pages-front/articleAll_files/js(1)"></script>
<script async="" src="../pages-front/articleAll_files/gtm.js.download"></script>
<script src="../pages-front/articleAll_files/jquery-3.3.1.slim.min.js.download"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="../pages-front/articleAll_files/popper.min.js.download"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script src="../pages-front/articleAll_files/bootstrap.min.js.download"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../pages-front/articleAll_files/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link href="../pages-front/articleAll_files/css" rel="stylesheet">
<link href="../pages-front/articleAll_files/css(1)" rel="stylesheet">
<link href="../pages-front/articleAll_files/css(2)" rel="stylesheet">
<link rel="stylesheet" href="../pages-front/articleAll_files/w3.css">
<link rel="stylesheet" type="text/css"
	href="../pages-front/articleAll_files/style.css">

<script async="" src="../pages-front/articleAll_files/js(2)"></script>

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
	/* The image used */
	background-image:
		url("https://images.unsplash.com/photo-1476242906366-d8eb64c2f661?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1908&q=80");
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

.serviceimg {
	position: absolute;
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
	padding-top: 5%;
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

.job-block {
	background-color: #BD2125;
	width: 200px;
	color: white;
	font-size: 32px;
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

<button class="btn btn-sm" onclick="topFunction()" id="myBtn"
	title="Go to top">
	<i class="fas fa-arrow-up" style="font-size: 26px;"></i>
</button>
<!--------------------------home------------------------------------>
<div class="parallax">
	<br>
	<div align="center" class="logojob" data-aos="fade-down"
		data-aos-duration="800">
		<div class="job-block font-weight-bolder">Blog</div>
		<br> <font size="5px">Professional IT People ~ Innovative
			IT Solutions<br>
		</font> <font size="3px">IT Staff Outsourcing Services | IT
			consultants | Custom Software Solutions</font>

	</div>
	<div class="articleblockbg">
		<div data-aos="fade-down" data-aos-duration="800">
			<font color="#BD2125">
				<h3>
					<b>Blog</b>
				</h3>
			</font>
		</div>
		<br>
		<hr class="new">
		<div id="articledetail1">
			<div class="row articleblockbg2">
				<div class="col-lg-6">
					<div class="articleblockbg3">
						<a class="" href="blog_detail?articleId=${newBlog.article_id}"
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
						<a href="blog_detail?articleId=${newBlog.article_id}"
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
			<c:forEach var="blog" items="${blogList}" varStatus="Count">
				<div class='col-lg-4 articleblockbg2'>
					<left>
					<div class='articleblockbg3'>
						<a href='blog_detail?articleId=${blog.article_id}' role='button'>
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
