<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="comp"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.cubesofttech.util.ArticleHtmlSanitizer"%>

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
	margin-top: 50px;
	font-size: 15px;
	scroll-behavior: smooth;
	padding-right: 0 !important;
}

#navbar-hover:hover {
	color: #BD2125 !important;
	text-decoration: none;
	border-color: white white #BD2125 !important;
	border-bottom: 4px solid;
}

.article-hero {
	position: relative;
	height: 480px;
	margin-top: 24px;
	overflow: hidden;
	background-color: #1A1A1A;
}

.article-hero::before, .article-hero::after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: var(--hero-image, none);
	background-position: center;
	background-repeat: no-repeat;
}

.article-hero::before {
	background-size: cover;
	filter: blur(20px) brightness(0.6);
	transform: scale(1.15);
}

.article-hero::after {
	background-size: contain;
}

.article-hero__expand-btn {
	position: absolute;
	top: 16px;
	right: 16px;
	z-index: 3;
	width: 40px;
	height: 40px;
	border: none;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.5);
	color: #fff;
	font-size: 18px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.article-hero__expand-btn:hover {
	background-color: rgba(0, 0, 0, 0.75);
	color: #fff;
}

.article-hero-modal__content {
	background: transparent;
	border: none;
}

.article-hero-modal__image {
	max-width: 80vw;
	max-height: 80vh;
	width: auto;
	height: auto;
	object-fit: contain;
	border-radius: 10px;
	align-self: center;
}

.article-hero-modal__close {
	font-size: 32px !important;
	position: absolute;
	top: -40px;
	right: 0;
	color: #fff !important;
	opacity: 1;
	text-shadow: none;
	z-index: 1;
}

@media ( max-width : 767px) {
	.article-hero {
		height: 280px;
	}
}

.article-hero-card {
	position: relative;
	margin-top: -140px;
	border-radius: 16px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
	padding: 30px 20px;
}

@media ( max-width : 767px) {
	.article-hero-card {
		margin-top: -80px;
	}
}

.active {
	border-color: white white #BD2125 !important;
	border-bottom: 4px solid;
	color: #BD2125 !important;
}

.setpo {
	margin-right: -20px;
}

/* .container / .header removed - this page doesn't use those classes itself;
   they were only colliding with header.jsp's real .container (hamburger
   icon) and .header (navbar wrapper), since Tiles concatenates every
   fragment's <style> into one page. */

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

.detail {
	background-color: white;
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

/* Distraction-free reading layout: the article column is centered with
   its own reading-measure max-width instead of the old col-lg-9 (9/12 of
   the whole page), and there's no more col-lg-3 sidebar running alongside
   it - related articles moved to their own horizontal section below the
   content instead (see .related-articles-section). This matters for this
   site specifically because the blog exists for SEO/topical-authority,
   not pageview count: a sidebar competing for attention the whole way
   down encourages bouncing away before finishing the article, and read-
   through is what actually feeds the ranking signal this content is for.

   720px keeps .article-body's 17px text at roughly 75-90 characters per
   line - the classic 50-75 English-character reading measure, nudged up
   because Thai runs a little denser per line than Latin text at the same
   width (no inter-word spaces, stacked vowel/tone marks). Mobile skips
   the max-width entirely: the screen is already narrow enough that
   constraining it further would only waste space, not help readability. */
.article-content {
	margin: 0 auto;
}

@media ( min-width : 768px) {
	.article-content {
		max-width: 720px;
	}
}

.related-articles-section {
	margin-top: 4rem;
	padding-top: 2rem;
	border-top: 1px solid var(--article-border, #E7DEDE);
}

.related-articles-section__heading {
	margin-bottom: 1.5rem;
}

.related-articles-section__cta {
	display: flex;
	justify-content: center;
	margin-bottom: 50px;
}

.related-articles-section__cta-btn {
	position: relative;
	display: inline-flex;
	align-items: center;
	gap: 8px;
	overflow: hidden;
	z-index: 1;
	padding: 0.6rem 1.75rem;
	border: 3px solid #BD2125;
	border-radius: 10px;
	color: #000;              /* สี base เป็นดำตามที่บอก */
	background-color: transparent;
	font-weight: 600;
	text-decoration: none;
	transition: color 0.3s ease;
}

.related-articles-section__cta-btn::before {
	content: "";
	position: absolute;
	inset: 0;
	background-color: #BD2125;
	transform: scaleX(0);
	transform-origin: left;
	z-index: -1;
	transition: transform 0.35s cubic-bezier(0.4, 0, 0.2, 1);
}

.related-articles-section__cta-btn:hover::before {
	transform: scaleX(1);
}

.related-articles-section__cta-btn:hover {
	color: #fff;
	text-decoration: none;
}

/* สำคัญ: บังคับให้ text กับ icon ใช้สีเดียวกับปุ่มหลักเสมอ (currentColor)
   กันกรณีมี color ถูก set แยกไว้เองจนไม่ตาม parent ตอน hover */
.related-articles-section__cta-btn-text {
	color: inherit;
}

.related-articles-section__cta-btn-icon {
	color: currentColor;   /* icon font (Bootstrap Icons) ใช้ currentColor เป็น default อยู่แล้ว แต่ใส่ชัดๆ กันเหนียว */
	width: 0;
	opacity: 0;
	transform: translateX(-8px);
	transition: width 0.3s ease, opacity 0.3s ease, transform 0.3s ease;
	font-size: 18px;
}

.related-articles-section__cta-btn:hover .related-articles-section__cta-btn-icon {
	width: 18px;
	opacity: 1;
	transform: translateX(0);
}

.article-tags {
	margin: 0.75rem 0;
}

/* .articleblockbg2/3, .ardetail, .aum, .ardetail__meta/__excerpt,
   .text-ellipsis-2, .article-card__image match blog.jsp's card design
   exactly - both pages render the same shared WEB-INF/tags/blogCard.tag,
   so the two need matching CSS to actually look the same, not just share
   markup. No col-* grid class here (unlike blog.jsp) since these cards
   stack full-width in this page's narrow sidebar column instead of a
   3-per-row full-width row. */
.articleblockbg2 {
	padding-top: 0%;
	padding-bottom: 4rem;
	text-align: left;
	transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
	cursor: pointer;
}

.articleblockbg2:hover {
	transform: translateY(-6px);
}

.articleblockbg2:hover .aum {
	color: #BD2125;
}

/* The whole card is one <a> now (blogCard.tag) - links are inline by
   default, which would otherwise collapse/misrender the block-level
   .articleblockbg3/.ardetail stacked inside it, and reset its default
   blue/underlined styling since this is a card, not a text link.
   :hover needed separately - Bootstrap's own "a:hover{text-decoration:
   underline}" (in the CDN stylesheet loaded site-wide) has higher
   specificity than the bare class selector below at rest, so without
   this the underline was reappearing the moment you hovered the card. */
.articleblockbg2__link,
.articleblockbg2__link:hover {
	display: block;
	color: inherit;
	text-decoration: none;
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
	min-height: 200px;
	display: flex;
	flex-direction: column;
}

.ardetail__meta {
	margin-top: auto;
}

.ardetail__excerpt {
	margin: 0.5rem 0;
	font-size: 14px;
	line-height: 1.5;
	color: #555;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
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
	margin: 40px;
}

.article-body h2, .article-body h3, .article-body h4 {
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

.article-body ul, .article-body ol {
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

.article-body blockquote p+p {
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
	aspect-ratio: 16/9;
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

.article-body th, .article-body td {
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

.article-body .faq-item>*:last-child {
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

<div class="article-hero"
	<c:if test="${!empty path}">style="--hero-image: url('${constant.imgContext}${path}');"</c:if>>
	<c:if test="${!empty path}">
		<button type="button" class="article-hero__expand-btn"
			data-toggle="modal" data-target="#heroImageModal"
			aria-label="ดูรูปเต็ม">
			<i class="bi bi-arrows-fullscreen"></i>
		</button>
	</c:if>
</div>

<c:if test="${!empty path}">
	<div class="modal fade" id="heroImageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl"
			role="document">
			<div class="modal-content article-hero-modal__content">
				<button type="button" class="close article-hero-modal__close"
					data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<img src="${constant.imgContext}${path}" alt="${blog.topic}"
					class="article-hero-modal__image">
			</div>
		</div>
	</div>
</c:if>

<div class="container">
	<div class="article-content">
		<div class="detail article-hero-card">
			<h1 itemprop="headline" style="color: #BD2125;">${blog.topic}</h1>

			<div class="article-tags">
				Tags : <font color="#BD2125"><span id="articletag"> <c:forEach
							var="tag" items="${tags}" varStatus="Count">
							<c:if test="${tag.article_id eq blog.articleId}">${tag.name} </c:if>
						</c:forEach>
				</span></font>
			</div>

			<div
				class="article-meta-bar d-flex flex-wrap align-items-center justify-content-between gap-3">
				<c:if test="${blog.timeUpdate != null}">
					<div
						class="ardetail__meta d-flex align-items-center gap-2 text-secondary small">
						<i class="bi bi-calendar3"></i> <span>Last Update : <fmt:formatDate
								pattern="d MMMM yyyy" value="${blog.timeUpdate}" /></span>
					</div>
				</c:if>

				<div class="article-shares d-flex align-items-center gap-3">
					<b>SHARES</b> <a
						href="https://www.facebook.com/sharer/sharer.php?u=http://www.cubesofttech.com${bloguri}"
						target="_blank"><img
						src="/pages-front/img/articleshares/svg/facebook_square.svg"
						width="25px" height="25px"></a> <a
						href="https://twitter.com/share?url=http://www.cubesofttech.com${bloguri}"
						target="_blank"><img
						src="/pages-front/img/articleshares/svg/twitter_x.svg"
						width="25px" height="25px"></a> <a
						href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;tf=1&amp;to=email@gmail.com&amp;body=http://www.cubesofttech.com${bloguri}"
						target="_blank"><img
						src="/pages-front/img/articleshares/svg/gmail.svg" width="28px"
						height="28px"></a> <a
						href="https://linkedin.com/shareArticle?url=http://www.cubesofttech.com${bloguri}"
						target="_blank"><img
						src="/pages-front/img/articleshares/svg/linkedin.svg" width="25px"
						height="25px"></a>
				</div>
			</div>
		</div>

		<article itemscope itemtype="https://schema.org/Article">
			<section itemprop="articleBody" class="article-body">${cleanDetail}</section>
		</article>
	</div>

	<%--
		relatedBlogs is manually curated by editors (article_related table) and
		may be empty for articles nobody has linked yet - falling back to
		latestBlogs (already fetched above for this same request) means this
		section still does its job (give the reader another article, which is
		also an internal link for SEO) instead of rendering an empty heading
		with nothing under it.
	--%>
	<c:set var="relatedCardSource"
		value="${not empty relatedBlogs ? relatedBlogs : latestBlogs}" />

	<section class="related-articles-section">
		<h2 class="related-articles-section__heading">
			<font color="gray">บทความที่เกี่ยวข้อง</font>
		</h2>
		<div class="row">
			<%-- end="2" caps this at 3 cards (indices 0-2) regardless of which
				 list is used - relatedBlogs is already limited to 3 at the DAO
				 level, but latestBlogs has no such limit, so this is what
				 actually enforces the cap in the fallback case. --%>
			<c:forEach var="relatedBlog" items="${relatedCardSource}" end="2"
				varStatus="Count">
				<%
				Object relatedBlogRaw = pageContext.getAttribute("relatedBlog");
				String relatedBlogDetailRaw = "";
				if (relatedBlogRaw instanceof Map) {
					Object d = ((Map) relatedBlogRaw).get("detail");
					relatedBlogDetailRaw = d != null ? d.toString() : "";
				}
				pageContext.setAttribute("relatedBlogPreviewText", ArticleHtmlSanitizer.toPreviewText(relatedBlogDetailRaw, 120));
				%>
				<div class="col-12 col-sm-6 col-lg-4">
					<comp:blogCard blog="${relatedBlog}" constant="${constant}"
						excerpt="${relatedBlogPreviewText}" />
				</div>
			</c:forEach>
		</div>

		<div class="related-articles-section__cta">
			<a href="${pageURI}" class="related-articles-section__cta-btn"> <span
				class="related-articles-section__cta-btn-text">ดูบทความทั้งหมด</span>
				<i class="bi bi-arrow-right related-articles-section__cta-btn-icon"></i>
			</a>
		</div>
	</section>
</div>


<%--
	aos.css/aos.js and jQuery both already load once in baseLayout.jsp's
	<head> (every page shares it) - this page had its own second copy of
	both. Safe to drop here specifically (checked first): no $.ajax/.load/
	effects calls on this page. AOS.init() below still needs to stay -
	baseLayout.jsp only loads the library, each page still calls .init()
	itself.
--%>
<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	AOS.init();

	$('#heroImageModal').on('hidden.bs.modal', function() {
		$('body').css('padding-right', '');
		$('.modal-backdrop').remove();
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
