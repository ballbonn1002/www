<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="../pages-front/articledetail_files/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="../pages-front/articledetail_files/jquery-3.3.1.slim.min.js.download"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="../pages-front/articledetail_files/popper.min.js.download"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script src="../pages-front/articledetail_files/bootstrap.min.js.download"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../pages-front/articledetail_files/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link href="../pages-front/articledetail_files/css" rel="stylesheet">
<link rel="stylesheet" href="../pages-front/articledetail_files/w3.css">
<link rel="stylesheet" type="text/css"
	href="../pages-front/articledetail_files/style.css">
<script src="../pages-front/articledetail_files/jquery-2.1.4.min.js.download"></script>
<script src="../pages-front/articledetail_files/date.format.js.download"></script>

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
	background-image: url("pages-front/img/article/bgarticle.jpg");
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

h1, h2, h3, h4, h5, h6 {
	font-family: "Segoe UI", Arial, sans-serif;
	font-weight: 400;
	margin: 10px 0;
}

h5 {
	font-size: 18px;
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

a:link {
	color: #000;
}

.detail {
	background-color: white;
	box-shadow: 0px 10px 20px -5px rgba(0, 0, 0, 0.75);
	margin-left: 0%;
	margin-right: 0%;
	margin-top: 0%;
	margin-bottom: 5%;
	padding-left: 5%;
	padding-right: 3%;
	padding-top: 5%;
	padding-bottom: 5%;
}

@media only screen and (max-width: 600px) {
	.detail {
		padding-left: 5%;
		padding-right: 5%;
	}
}

hr.detailnew {
	border-top: 2px solid lightgray;
	margin: 0 0 0;
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

.articledetail {
	margin-right: 5%;
}

.arrelate {
	padding-left: 5%;
}

.vtnew {
	border-left: 2px solid lightgray;
	margin: 0 0 0;
}

.articleblockbg2 {
	padding-top: 5%;
	padding-bottom: 3%;
	padding-left: 5%;
	padding-right: 0;
	margin-left: 5%;
	width: 100%;
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

.ardetail {
	padding-top: 5%;
	padding-bottom: 5%;
	padding-left: 5%;
	padding-right: 5%;
	background-color: #f0f0f0;
	box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
}

.aum {
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	-ms-text-overflow: ellipsis;
	overflow: hidden;
	width: 300px;
	font-size: 20px;
	color: #BD2125;
	font-weight: bold;
	padding-right: 5%;
}

.aum1 {
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	-ms-text-overflow: ellipsis;
	overflow: hidden;
	width: 300px;
}
</style>

<button class="btn btn-sm" onclick="topFunction()" id="myBtn"
	title="Go to top">
	<i class="fas fa-arrow-up" style="font-size: 26px;"></i>
</button>
<!-- endmenu -->
<!--------------------------home------------------------------------>

<div class="parallax show-on-scroll">
	<div align="center" class="logojob aos-init aos-animate"
		data-aos="fade-down" data-aos-duration="800">
		<div class="job-block font-weight-bolder">ARTICLE</div>
		<br> <font size="5px">Professional IT People ~ Innovative
			IT Solutions<br>
		</font> <font size="3px">IT Staff Outsourcing Services | IT
			consultants | Custom Software Solutions</font>

	</div>
	<br>

	<div>


		<div class="detail">
			<div class="row">
				<div class="col-lg-9" id="articledetail">
					<!-- <span id="datetag"></span>|  -->
					Tags : <font color="#BD2125"><span id="articletag"> <c:forEach
								var="tag" items="${tags}" varStatus="Count">
								<c:if test="${tag.article_id eq blog.articleId}">${tag.name} </c:if>
							</c:forEach>
					</span></font>
					<div class="articledetail">
						<h2>${blog.topic}</h2>
						<h6>
							<b>SHARES</b>&nbsp;&nbsp;&nbsp; <a
								href="https://www.facebook.com/sharer/sharer.php?u=http://www.cubesofttech.com/articledetail.php?article_id=19"
								target="_blank"><img
								src="pages-front/img/articleshares/facebook.png" width="25px"
								height="25px"></a>&nbsp;&nbsp;&nbsp; <a
								href="https://twitter.com/share?url=http://www.cubesofttech.com/articledetail.php?article_id=19"
								target="_blank"><img
								src="pages-front/img/articleshares/twitter.png" width="25px"
								height="25px"></a>&nbsp;&nbsp;&nbsp; <a
								href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=email@gmail.com&amp;body=http://www.cubesofttech.com/articledetail.php?article_id=19"
								target="_blank"><img
								src="pages-front/img/articleshares/gmail.png" width="25px"
								height="25px"></a>&nbsp;&nbsp;&nbsp; <a
								href="https://linkedin.com/shareArticle?url=http://www.cubesofttech.com/articledetail.php?article_id=19"
								target="_blank"><img
								src="pages-front/img/articleshares/linkedin.png" width="25px"
								height="25px"></a>
						</h6>
						<br>
						<center>
							<c:if test="${!empty path}">
								<img src='${path}' width='70%' height='70%'
									style='object-fit: cover;'>
							</c:if>
						</center>
						<br> ${blog.detail}
					</div>
				</div>
				<div class="col-lg-3 vtnew">
					<b><h5 class="arrelate">
							<font color="gray">บทความที่เกี่ยวข้อง</b></font>
					</h5>
					<div class="row" id="articledetail1">
						<c:forEach var="relatedBlog" items="${relatedBlogs}" varStatus="Count">
							<div class="articleblockbg2">
								<left>
								<div class="articleblockbg3">
									<a class="" href="blog_detail?articleId=${relatedBlog.related_article_id}"
										role="button"> <img src="${relatedBlog.path}" width="100%"
										height="180px" style="object-fit: cover;"></a>
								</div>
								<div class="ardetail">
									<div class="aum">${relatedBlog.topic}</div>
								</div>
								</left>
							</div>
						</c:forEach>
					</div>
					<br>
					<hr class="detailnew">
					<br> <b><h5 class="arrelate">
							<font color="gray">บทความล่าสุด</b></font>
					</h5>
					<div class="row" id="articledetail2">
						<c:forEach var="latestBlog" items="${latestBlogs}" varStatus="Count">
							<c:if test="${Count.count <= maxLatestBlog}">
								<div class="articleblockbg2">
									<left> <a class=""
										href="blog_detail?articleId=${latestBlog.article_id}" role="button"></a>
									<div class="aum1">
										<a class="" href="blog_detail?articleId=${latestBlog.article_id}"
											role="button">${latestBlog.topic}</a>
									</div>
									</left>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>


	</div>
</div>
