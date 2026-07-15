<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.cubesofttech.util.ArticleHtmlSanitizer"%>
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
/* ==========================================================================
   1. Layout - Hero / Page header
   ========================================================================== */
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

/* .container / .header removed - this page doesn't use those classes itself;
   they were only colliding with header.jsp's real .container (hamburger
   icon) and .header (navbar wrapper), since Tiles concatenates every
   fragment's <style> into one page. */

/* ==========================================================================
   2. Navbar (cross-fragment: styles elements rendered by header.jsp)
   ========================================================================== */
/* #navbar-hover:hover { */
/* 	color: #BD2125 !important; */
/* 	text-decoration: none; */
/* 	border-color: white white #BD2125 !important; */
/* 	border-bottom: 4px solid; */
/* } */

/* /* Targets the nav-links rendered by header.jsp (toggled via the JS */
/*    requestURI check below), not anything inside this page's own markup. */
/*    Left unscoped/global on purpose - see refactor notes for why. */
* /
	/* .parallax .active { */
	/* 	border-color: white white #BD2125 !important; */
	/* 	border-bottom: 4px solid; */
	/* 	color: #BD2125 !important; */
	/* } */
	/* ==========================================================================
   3. Mobile menu icon (cross-fragment: header.jsp's hamburger button)
   header.jsp's <div class="bar"> bars (its collapse toggle icon) have no
   style of their own and depend on whatever body fragment Tiles renders
   alongside them providing this rule. Unused by this page's own markup,
   but required for the hamburger icon to render on this page. See
   refactor notes.
   ========================================================================== */
	
	
.bar {
	width: 30px;
	height: 3px;
	background-color: #333;
	margin: 6px 0;
	transition: 0.4s;
}

/* ==========================================================================
   4. Scroll-to-top button
   ========================================================================== */
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

/* ==========================================================================
   5. Global typography resets
   Broad element selectors (kept as-is - see refactor notes on why they
   are not scoped in this pass).
   ========================================================================== */
p {
	margin: 0 0 0;
}

a {
	color: #000;
}

/* ==========================================================================
   6. Featured article (hero card)
   ========================================================================== */
.article-preview {
	max-width: 100%;
}

.article-preview__row {
	padding-top: 0%;
	padding-bottom: 0%;
	padding-left: 0%;
	padding-right: 0%;
}

/* Scoped grid override: only affects the two col-lg-6 columns inside this
   page's featured-article row, instead of every col-lg-6 element site-wide
   (services.jsp and contacts.jsp also define col-lg-6 markup and would
   otherwise inherit this height unintentionally if ever rendered together). */
.article-preview__row .col-lg-6 {
	-ms-flex: 0 0 50%;
	flex: 0 0 50%;
	max-width: 50%;
	height: 500px;
}

.article-preview__media {
	position: sticky;
	top: 20px;
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
	max-height: 200px;
	overflow: hidden;
	margin: 0 0 1rem 0;
	line-height: 1.6;
	position: relative;
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

.article-preview__excerpt * {
	margin: 0 !important;
	padding: 0 !important;
}

/* Scoped Bootstrap-button override: only applies to this exact CTA
   (which already carries both classes), instead of every .btn-danger /
   .btn-lg button site-wide. */
.article-preview__cta.btn-danger {
	color: #fff;
	background-color: #C41216;
	border-color: #dc3545;
}

.article-preview__cta.btn-lg {
	display: inline-block;
	padding: 0.5rem 1rem;
	font-size: 1.25rem;
	line-height: 1.5;
	border-radius: 0.3rem;
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

/* ==========================================================================
   7. Article card list
   ========================================================================== */
.article-list-row {
	padding-top: 60px;
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

.article-card__image {
	object-fit: cover;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
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

.ardetail__meta {
	margin-top: auto;
}

.aum {
	overflow: hidden;
	width: 100%;
	font-size: 20px;
	color: #000;
	font-weight: bold;
	transition: color 0.2s ease;
}

.text-ellipsis-2 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
	word-break: break-word;
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

		<%
			// BlogDAO's native-SQL queries (findAllBlogsWithPageUri/findAllNewsWithPageUri)
			// use AliasToEntityMapResultTransformer, so "newBlog" is really a
			// java.util.Map<String,Object> at runtime, not a Blog entity - the DAO's
			// declared List<Blog> return type doesn't reflect that. EL (${newBlog.detail})
			// works either way since it resolves Map keys and bean getters the same way,
			// but a Java-level cast has to match the real runtime type.
			Object newBlogRaw = request.getAttribute("newBlog");
			String rawDetail = "";
			if (newBlogRaw instanceof Map) {
				Object detail = ((Map) newBlogRaw).get("detail");
				rawDetail = detail != null ? detail.toString() : "";
			}
			request.setAttribute("cleanDetail", ArticleHtmlSanitizer.clean(rawDetail));
		%>

		<div class="page-header">
			<h1 class="page-title">${pageLabel}</h1>

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
							alt="${newBlog.topic}" width="805" height="475">
						</a>
					</figure>
				</div>

				<div class="col-lg-6 order-lg-1">
					<div class="article-preview__content">
						<h2 class="article-preview__title">${newBlog.topic}</h2>

						<%-- 						<div class="article-preview__excerpt">${newBlog.detail}</div> --%>
						<div itemprop="articleBody" class="article-preview__excerpt">${cleanDetail}</div>

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
		<div class="row article-list-row" id="articledetail">
			<c:forEach var="blog" items="${blogList}" varStatus="Count" begin="1">
				<div class="col-lg-4 articleblockbg2">
					<div class="articleblockbg3">
						<a href="${blog.page_uri_id}" role="button"> <img
							class="article-card__image"
							src="${constant.imgContext}${blog.path}" width="100%"
							height="250px" alt="${blog.topic}" loading="lazy">
						</a>
					</div>
					<div class="ardetail">
						<h3 class="aum text-ellipsis-2">${blog.topic}</h3>
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
