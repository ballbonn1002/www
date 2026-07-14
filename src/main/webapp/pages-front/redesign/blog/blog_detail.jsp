<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:title" content="${blog.topic}">
<meta property="og:description" content="${metaDescription}">
<meta property="og:image" content="${constant.imgContext}${path}">
<meta property="og:url" content="https://www.cubesofttech.com${bloguri}">
<meta property="og:type" content="article">
<meta property="og:site_name" content="Cube SoftTech">

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://www.cubesofttech.com${bloguri}"
  },
  "headline": "${blog.topic}",
  "description": "${metaDescription}",
  "image": "${constant.imgContext}${path}", 
  "author": {
    "@type": "Organization",
    "name": "Cube SoftTech",
	"url": "https://www.cubesofttech.com",
	"sameAs": [
  		"https://www.facebook.com/CubeSoftTech"
	]
  },  
  "publisher": {
    "@type": "Organization",
    "name": "Cube SoftTech",
    "logo": {
      "@type": "ImageObject",
      "url": "${constant.webPath}/pages-front/img/logo/cubesofttech.png"
    }
  },
  "datePublished": "${datePublished}",
  "dateModified": "${dateModified}"
}
</script>
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
	background-image: url("/pages-front/img/article/bgarticle.jpg");
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

#articledetail a {
	color: #337ab7 !important;
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

/* =====================================================================
   .article-body — central style for ${cleanDetail} (the sanitized article
   HTML). ArticleHtmlSanitizer (com.cubesofttech.util) strips every
   class/style attribute from the source content, so this stylesheet styles
   plain semantic tags (h2, p, ul, blockquote, table, ...) directly and is
   the only place that controls how article content looks, regardless of
   the source article's own markup.

   Kept deliberately separate from the pre-existing ".articledetail" class
   used above for page layout (header/share bar) to avoid selector collisions.
   ===================================================================== */
:root {
	--article-ink: #2B2222;
	--article-ink-muted: #7A6C6C;
	--article-accent: #BD2125;
	--article-accent-strong: #8F191C;
	--article-accent-soft: #F7E6E6;
	--article-border: #E7DEDE;
	--article-surface-soft: #FAF6F6;
	--article-code-ink: #8A2A2C;
}

.article-body {
	font-size: 17px;
	line-height: 1.85;
	color: var(--article-ink);
}

.article-body h2,
.article-body h3,
.article-body h4 {
	color: var(--article-ink);
	font-weight: 700;
	line-height: 1.4;
}
.article-body h2 {
	font-size: 26px;
	margin: 52px 0 20px;
	padding-bottom: 12px;
	border-bottom: 1px solid var(--article-border);
}
.article-body h2:first-child {
	margin-top: 0;
}
.article-body h3 {
	font-size: 20px;
	margin: 34px 0 14px;
}
.article-body h4 {
	font-size: 17px;
	margin: 24px 0 10px;
}

.article-body p {
	margin: 0 0 20px;
}

.article-body strong {
	font-weight: 700;
	color: var(--article-ink);
}

.article-body a {
	color: var(--article-accent);
	text-decoration: underline;
}
.article-body a:hover {
	color: var(--article-accent-strong);
}

.article-body ul,
.article-body ol {
	margin: 0 0 24px;
	padding-left: 1.4em;
}
.article-body li {
	margin-bottom: 10px;
}
.article-body li::marker {
	color: var(--article-accent);
	font-weight: 700;
}

.article-body blockquote {
	margin: 32px 0;
	padding: 20px 24px;
	border-left: 4px solid var(--article-accent);
	background: var(--article-accent-soft);
	border-radius: 0 10px 10px 0;
	font-size: 18px;
	font-weight: 600;
	color: var(--article-ink);
}
.article-body blockquote p {
	margin: 0;
}
.article-body blockquote p + p {
	margin-top: 10px;
}

.article-body code {
	font-family: Consolas, Monaco, monospace;
	font-size: 0.9em;
	padding: 2px 7px;
	border-radius: 5px;
	background: var(--article-surface-soft);
	color: var(--article-code-ink);
	border: 1px solid var(--article-border);
}

.article-body img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	display: block;
	margin: 28px 0;
}

/* youtube embeds only (see ArticleHtmlSanitizer) — width/height attributes
   from the source are overridden so it scales responsively */
.article-body iframe {
	width: 100%;
	aspect-ratio: 16 / 9;
	height: auto;
	border: none;
	border-radius: 10px;
	display: block;
	margin: 28px 0;
}

/* every table renders the same way regardless of source classname —
   scrolls horizontally on its own, no wrapper div required */
.article-body table {
	display: block;
	overflow-x: auto;
	width: 100%;
	border-collapse: collapse;
	margin: 28px 0;
	font-size: 15px;
	-webkit-overflow-scrolling: touch;
}
.article-body th,
.article-body td {
	padding: 12px 16px;
	border-bottom: 1px solid var(--article-border);
	text-align: left;
	vertical-align: top;
	white-space: nowrap;
}
.article-body th {
	background: var(--article-accent-soft);
	color: var(--article-ink);
	font-weight: 700;
}
.article-body tr:last-child td {
	border-bottom: none;
}

/* .faq-item / .faq-question are generated by ArticleHtmlSanitizer itself
   (com.cubesofttech.util) — not sourced from the article's own markup — so
   the classnames are guaranteed consistent across every article. */
.article-body .faq-item {
	padding: 22px 0;
	border-bottom: 1px solid var(--article-border);
}
.article-body .faq-item:last-child {
	border-bottom: none;
}
.article-body .faq-item > *:last-child {
	margin-bottom: 0;
}
.article-body .faq-question {
	font-size: 18px;
	font-weight: 700;
	color: var(--article-ink);
	margin: 0 0 8px;
}
.article-body .faq-question::before {
	content: "Q. ";
	color: var(--article-accent);
}
</style>

<button class="btn btn-sm" onclick="topFunction()" id="myBtn"
	title="Go to top">
	<i class="fas fa-arrow-up" style="font-size: 26px;"></i>
</button>
<!-- endmenu -->
<!--------------------------home------------------------------------>

<div class="parallax show-on-scroll">
	<div align="center" class="logojob"
		data-aos="fade-down" data-aos-duration="800">
		<c:if test="${fn:contains(pageURI, 'blog')}"><div class="job-block font-weight-bolder">BLOG</div></c:if>
		<c:if test="${fn:contains(pageURI, 'news')}"><div class="job-block font-weight-bolder">NEWS</div></c:if>
		<br> <font size="5px">Professional IT People ~ Innovative
			IT Solutions<br>
		</font> <font size="3px">IT Staff Outsourcing Services | IT
			consultants | Custom Software Solutions</font>

	</div>
	<br>

	<div>
		<div class="detail">
			<div>
				<ul class="breadcrumb">
					<li><a href="/">Home</a>&nbsp;/&nbsp;</li>
					<li><a href="javascript:history.back()" id="model">
						<c:if test="${fn:contains(pageURI, 'blog')}">Blog</c:if>
						<c:if test="${fn:contains(pageURI, 'news')}">News</c:if></a>&nbsp;/&nbsp;</li>
					<li><a class="currentPage" id="parent">${blog.topic}</a></li>
				</ul>
			</div>
			<div class="row">
				<div class="col-lg-9" id="articledetail">
					<article itemscope itemtype="https://schema.org/Article">
							<c:if test="${!empty path}">
								<div style="text-align: center;">
    								<img src="${constant.imgContext}${path}"
    								width="70%" height="70%" style="object-fit: cover; 
    								margin-bottom: 20px;" alt= "${alt_name}">
								</div> 
							</c:if>
					<!-- <span id="datetag"></span>|  -->
					Tags : <font color="#BD2125"><span id="articletag"> 
							<c:forEach
 								var="tag" items="${tags}" varStatus="Count">
 								<c:if test="${tag.article_id eq blog.articleId}">${tag.name} </c:if>
 							</c:forEach>
					</span></font>
					<div class="articledetail">
					<header>
						<h1 itemprop="headline">${blog.topic}</h1>
						 <c:if test="${blog.timePost != null}"><p class="text-muted" style="padding: 0px 0px 0px 0px">Last updated : 
							<fmt:formatDate pattern = "d MMM yyyy" value = "${blog.timePost}"/></p></c:if>
					</header>
						<p>
							<b>SHARES</b>&nbsp;&nbsp;&nbsp; <a
								href="https://www.facebook.com/sharer/sharer.php?u=http://www.cubesofttech.com${bloguri}"
								target="_blank"><img
								src="/pages-front/img/articleshares/svg/facebook_square.svg" width="25px"
								height="25px">
								</a>&nbsp;&nbsp;&nbsp; <a
								href="https://twitter.com/share?url=http://www.cubesofttech.com${bloguri}"
								target="_blank"><img
								src="/pages-front/img/articleshares/svg/twitter_x.svg" width="25px"
								height="25px"></a>&nbsp;&nbsp;&nbsp; <a
								href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=email@gmail.com&amp;body=http://www.cubesofttech.com${bloguri}"
								target="_blank"><img
								src="/pages-front/img/articleshares/svg/gmail.svg" width="28px"
								height="28px"></a>&nbsp;&nbsp;&nbsp; <a
								href="https://linkedin.com/shareArticle?url=http://www.cubesofttech.com${bloguri}"
								target="_blank"><img
								src="/pages-front/img/articleshares/svg/linkedin.svg" width="25px"
								height="25px"></a>
						</p>
						
						<br>
						<!-- HTML Display here -->
						<br> <section itemprop="articleBody" class="article-body">${cleanDetail}</section>
						<!-- HTML Display here -->
					</div>
					</article>
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
									<a class="" href="${relatedBlog.page_uri_id}"
										role="button"> <img src="${constant.imgContext}${relatedBlog.path}" width="100%"
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
										href="${latestBlog.page_uri_id}" role="button"></a>
									<div class="aum1">
										<a class="" href="${latestBlog.page_uri_id}"
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


<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">

	AOS.init();
	
	$(document).ready(function() {
		var requestURI = '${requestURI}';
		console.log("requestURI: "+requestURI);
		if(requestURI.includes("blog")){
			$('a[href="/blog"]').addClass('active');
		}else{
			$('a[href="/news"]').addClass('active');
		}
		
	});
	
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
