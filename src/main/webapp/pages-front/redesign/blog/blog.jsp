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
	/*     background-image: url("https://images.unsplash.com/photo-1476242906366-d8eb64c2f661?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1908&q=80"); */
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

/* .navbar-light .navbar-toggler-icon { */
/* 	background-image: */
/* 		url(https://cdn.dribbble.com/users/976841/screenshots/3452262/dribbble-upload.gif) */
/* 		!important; */
/* } */
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
	margin-top: 32px;
}

.articleblockbg3 {
	
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
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	min-height: 150px; /* เปลี่ยนจาก height ตายตัว เป็น min-height */
	display: flex; /* ต้องมีตัวนี้ ไม่งั้น margin-top:auto ใช้ไม่ได้ */
	flex-direction: column;
}

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
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
}

.aum {
	overflow: hidden;
	width: 100%;
	font-size: 20px;
	color: #000;
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
	background-color: #C41216;
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

/* new style */
.page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
}

.page-title {
	margin: 0;
	font-size: 16px;
	font-weight: 600;
}

.article-detail-text {
	margin: 0;
	overflow-wrap: break-word;
	animation-name: none !important;
	transition-property: none !important;
	box-sizing: inherit;
}

/* กัน layout ล้นจอทั้งหน้า เผื่อ element อื่นก็มีปัญหาเดียวกัน */
body {
	overflow-x: hidden;
}

.article-detail__media {
	position: sticky;
	top: 20px;
}

.article-preview {
	max-width: 100%;
}

.article-preview__row {
	padding-top: 0%;
	padding-bottom: 0%;
	padding-left: 0%;
	padding-right: 0%;
}

.article-preview__media {
	height: 100%;
	margin: 0;
}

.article-preview__image {
	width: 100%;
	height: 100%; 
	object-fit: cover;
	border-radius: 10px;
	display: block;
}

/* เปลี่ยนจาก height:400px + overflow:hidden ตายตัว
   มาเป็น flex column เพื่อดันปุ่มลงล่างสุดได้ */
.article-preview__content {
	min-height: 400px;
	display: flex;
	flex-direction: column;
	text-align: left;
}

.article-preview__title {
	width: 100%;
	font-size: 36px;
	color: #BD2125;
	font-weight: bold;
	margin: 0 0 1rem 0;
	line-height: 48px;
}

/* ย้ายการตัดความสูง/overflow มาไว้ตรงนี้แทน กันข้อความ+HTML ที่ฝังมายาวเกิน
   โดยไม่กระทบปุ่มที่อยู่ข้างล่าง */
.article-preview__excerpt {
	max-height: 200px; overflow : hidden;
	margin: 0 0 1rem 0;
	line-height: 1.6;
	position: relative;
	overflow: hidden;
}

/* รีเซ็ต margin ของทุก element ที่ฝังมากับ rich text
   กัน margin สะสมกินพื้นที่ 130px แบบไม่จำเป็น */
.article-preview__excerpt>* {
	margin: 0 0 0.5em 0;
}

.article-preview__excerpt>*:last-child {
	margin-bottom: 0;
}

.article-preview__excerpt img {
	max-width: 100%;
}

/* ซ่อน heading ใหญ่ๆ ที่อาจฝังมาใน rich text ไม่ให้กิน 130px
   เพราะใน preview card ไม่ควรมี h1/h2 ซ้อนกับ title หลัก */
.article-preview__excerpt h1, .article-preview__excerpt h2,
	.article-preview__excerpt h3 {
	display: none;
}

/* เพิ่ม fade เงาไล่สีตรงขอบล่าง บอก user ว่ายังมีเนื้อหาต่อ (ไม่ตัดห้วนๆ) */
.article-preview__excerpt::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 200px;
	background: linear-gradient(to bottom, rgba(255, 255, 255, 0),
		rgba(255, 255, 255, 0.5));
	pointer-events: none;
}

.article-preview__cta {
	display: inline-block;
	align-self: flex-start;
	margin-top: auto; /* ดันปุ่มไปอยู่ล่างสุดของกล่องเสมอ */
	border-radius: 10px !important;
	color: #fff !important;
}

.article-preview__divider {
	border-top: 1px solid #B2B2B2;
	opacity: 1;
	/* ต้อง reset เพราะ Bootstrap default hr มี opacity: 0.25 ทำให้สีเพี้ยนจากที่ตั้งไว้ */
}

.text-ellipsis-2 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
	word-break: break-word;
}

.articleblockbg2 {
	padding-top: 0%;
	padding-bottom: 3%;
	padding-left: 3%;
	padding-right: 3%;
	text-align: left;
	transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
	cursor: pointer;
}

.articleblockbg2:hover {
	transform: translateY(-6px);
}

/* เปลี่ยนสีเฉพาะ title ตอน hover แทนที่จะเปลี่ยนทั้งก้อน
   เพราะ meta bar (วันที่/ผู้เขียน) ควรคงสีเทาเดิมไว้ ไม่ต้องเปลี่ยนตาม */
.articleblockbg2:hover .aum {
	color: #BD2125;
}

.articleblockbg3 {
	overflow: hidden;
	border-radius: 10px 10px 0 0;
}

.aum {
	transition: color 0.2s ease;
}

.ardetail__meta {
	margin-top: auto;
}
</style>


<!--------------------------home------------------------------------>
<div class="parallax show-on-scroll">
	<br>
	<div class="articleblockbg">
		<c:set var="pageLabel" value="" />
		<c:if test="${fn:contains(requestURI, 'blog')}">
			<c:set var="pageLabel" value="Blog" />
		</c:if>
		<c:if test="${fn:contains(requestURI, 'news')}">
			<c:set var="pageLabel" value="News" />
		</c:if>

		<div class="page-header">
			<span class="page-title">${pageLabel}</span>

			<ul class="breadcrumb">
				<li><a href="/">Home</a>&nbsp;/&nbsp;</li>
				<li><a class="currentPage" id="model">${pageLabel}</a></li>
			</ul>
		</div>
		<article class="article-preview" id="articledetail1">
			<div class="row article-preview__row">

				<div class="col-lg-6 order-lg-2">
					<figure class="article-preview__media">
						<a href="${newBlog.page_uri_id}" class="article-preview__link"
							aria-label="อ่านบทความ: ${newBlog.topic}"> <img
							class="article-preview__image"
							src="${constant.imgContext}/${newBlog.path}"
							alt="${newBlog.topic}" width="805" height="475" loading="lazy">
						</a>
					</figure>
				</div>

				<div class="col-lg-6 order-lg-1">
					<div class="article-preview__content">
						<div class="article-preview__title">${newBlog.topic}</div>

						<div class="article-preview__excerpt">${newBlog.detail}</div>

						<hr class="my-4 article-preview__divider">

						<div
							class="d-flex align-items-center flex-wrap gap-4 text-secondary mb-4 small">
							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-calendar3"></i> <span>${newBlog.createDate}</span>
							</div>

							<div class="vr"></div>

							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-pencil-square"></i> <span>By
									${newBlog.author}</span>
							</div>
						</div>

						<a href="${newBlog.page_uri_id}"
							class="btn btn-danger btn-lg article-preview__cta" role="button">Read
							More</a>
					</div>
				</div>

			</div>
		</article>
		<div class="row" id="articledetail" style="padding-top: 60px;">
			<c:forEach var="blog" items="${blogList}" varStatus="Count" begin="1">
				<div class="col-lg-4 articleblockbg2">
					<div class="articleblockbg3">
						<a href="${blog.page_uri_id}" role="button"> <img
							src="${constant.imgContext}${blog.path}" width="100%"
							height="250px"
							style="object-fit: cover; border-top-left-radius: 10px; border-top-right-radius: 10px;">
						</a>
					</div>
					<div class="ardetail">
						<div class="aum text-ellipsis-2">${blog.topic}</div>
						<div
							class="ardetail__meta d-flex align-items-center flex-wrap gap-4 text-secondary small">
							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-calendar3"></i> <span>${blog.createDate}</span>
							</div>
							<div class="vr"></div>
							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-pencil-square"></i> <span>By
									${blog.author}</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<br>
</div>


<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	AOS.init();
	$(document).ready(function() {
		var requestURI = '${requestURI}';
		console.log("requestURI: " + requestURI);
		if (requestURI.includes("blog")) {
			$('a[href="/blog"]').addClass('active');
		} else {
			$('a[href="/news"]').addClass('active');
		}
		$('#model').removeClass('active');
	});

	function showNav() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}

	window.onscroll = function() {
		scrollFunction()
	};
	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
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
