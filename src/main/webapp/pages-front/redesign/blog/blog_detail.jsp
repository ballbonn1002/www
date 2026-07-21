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
/* margin-top removed - it was pushing the whole page (including the
   hero background below) down before ever reaching .article-hero,
   which had its own separate margin-top:24px on top of that, stacking
   into a visible gap of plain body background above the hero image.
   Letting the hero start right at the very top instead (see
   .article-hero/.article-hero__expand-btn below) so its background
   flows behind the fixed navbar like a normal hero section, with only
   the actually-clickable content inside it pushed down using
   --navbar-offset (header.jsp) - not the whole page. */
body, html {
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
	overflow: hidden;
	background-color: #1A1A1A;
	padding: calc(3% + var(--navbar-offset, 65px));
}

/* Blurred backdrop only now - genuinely decorative (a scaled/blurred
   duplicate sitting behind the real image below), so CSS background is
   the correct choice here and doesn't need an alt text of its own. The
   sharp foreground layer used to be a second ::after pseudo-element on
   this same background-image trick, which meant the actual hero photo
   had no <img> tag anywhere and therefore couldn't carry an alt
   attribute at all - see .article-hero__image below, a real <img>
   replacing it so the hero image is visible to Google Images/screen
   readers again, not just decoration. */
.article-hero::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: var(--hero-image, none);
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	filter: blur(20px) brightness(0.6);
	transform: scale(1.15);
}

.article-hero__image {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: contain;
	object-position: center;
}

.article-hero__expand-btn {
	position: absolute;
	/* .article-hero now starts right at the top of the page (no more
	   margin-top pushing the whole hero down - see that rule above),
	   so its own top edge sits behind the fixed navbar. This button is
	   real, clickable content though, not background - offset it past
	   --navbar-offset (header.jsp) plus the original 16px breathing
	   room, so it lands just below the navbar instead of hidden
	   underneath it. */
	top: calc(var(--navbar-offset, 80px) + 28px);
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

.article-title {
	color: var(--article-accent);
	font-weight: 700;
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
	padding-right: max(4px, calc(1.75rem - 8px - 18px));
	border: 3px solid #BD2125;
	border-radius: 10px;
	/* !important จำเป็นจริง ๆ ตรงนี้ (ทั้ง resting และ :hover ด้านล่าง) -
	   baseLayout.jsp มี "a { color: inherit !important; }" ใช้ทั้งเว็บ
	   (บังคับลิงก์ตามสีพ่อแม่เสมอ กันไม่ให้ลิงก์ในเนื้อหาโผล่เป็นสีฟ้า
	   default) - !important ชนะ specificity เสมอไม่ว่า selector จะเจาะจง
	   แค่ไหน ต้องใช้ !important สู้เท่านั้น เหมือน #navbar-hover:hover,
	   .active, .dropdown-item:hover ที่มีอยู่แล้ว (baseLayout.jsp/header.jsp) */
	color: #BD2125 !important;
	background-color: transparent;
	font-weight: 600;
	text-decoration: none;
	transition: color 0.3s ease;
}

.related-articles-section__cta-btn::before {
	content: "";
	position: absolute;
	background-color: #BD2125;
	transform: scaleX(0);
	transform-origin: left;
	z-index: -1;
	transition: transform 0.35s cubic-bezier(0.4, 0, 0.2, 1);
	inset: -3px;
	border-radius: inherit;
	will-change: transform;
}

.related-articles-section__cta-btn:hover::before {
	transform: scaleX(1);
}

.related-articles-section__cta-btn:hover {
	color: #fff !important;
	text-decoration: none;
}

.related-articles-section__cta-btn-text {
	color: inherit;
}

.related-articles-section__cta-btn-icon {
	color: currentColor;
	width: 18px;
	opacity: 0;
	transform: translateX(-8px);
	transition: opacity 0.3s ease, transform 0.3s ease;
	font-size: 18px;
}

.related-articles-section__cta-btn:hover .related-articles-section__cta-btn-icon
	{
	opacity: 1;
	transform: translateX(0);
	margin-right: 4px;
}

/* ==========================================================================
   Card carousel - shared by "related articles" and "latest articles"
   below.
   ========================================================================== */
.card-carousel {
	position: relative;
	margin: 0 0 1.5rem;
}

.card-carousel__track {
	display: flex;
	gap: 1.25rem;
	overflow-x: auto;
	scroll-behavior: smooth;
	padding: 0.25rem 0.25rem 0.75rem;
	scrollbar-width: none;
}

.card-carousel__track::-webkit-scrollbar {
	display: none;
}

.card-carousel__track>* {
	flex: 0 0 auto;
}

.card-carousel__nav {
	position: absolute;
	top: 40%;
	transform: translateY(-50%);
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: 1px solid var(--article-border, #E7DEDE);
	background-color: #fff;
	box-shadow: 0 4px 14px rgba(0, 0, 0, 0.12);
	display: flex;
	align-items: center;
	justify-content: center;
	color: #BD2125;
	font-size: 18px;
	cursor: pointer;
	z-index: 2;
	transition: background-color 0.2s ease, color 0.2s ease;
}

.card-carousel__nav:hover {
	background-color: #BD2125;
	color: #fff;
}

.card-carousel__nav[disabled] {
	opacity: 0;
	pointer-events: none;
}

.card-carousel__nav--prev {
	left: -18px;
}

.card-carousel__nav--next {
	right: -18px;
}

@media ( max-width : 767px) {
	.card-carousel__nav {
		display: none;
	}
}

.card-carousel__item {
	width: 320px;
	max-width: 82vw;
}

.latest-card {
	width: 200px;
	max-width: 50vw;
}

.latest-card__link {
	display: block;
	color: inherit;
	text-decoration: none;
}

.latest-card__link:hover {
	color: inherit;
	text-decoration: none;
}

.latest-card__media {
	display: block;
	position: relative;
	width: 100%;
	aspect-ratio: 16/9;
	border-radius: 16px;
	overflow: hidden;
	margin-bottom: 0.6rem;
}

.latest-card__image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
	transition: transform 0.3s ease;
}

.latest-card__link:hover .latest-card__image {
	transform: scale(1.06);
}

.latest-card__title {
	font-size: 0.9rem;
	font-weight: 600;
	line-height: 1.4;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.article-tags {
	margin: 0.75rem 0;
}

.articleblockbg2 {
	height: 100%;
	display: flex;
	flex-direction: column;
	padding-top: 0%;
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

.articleblockbg2__link, .articleblockbg2__link:hover {
	display: flex;
	flex-direction: column;
	height: 100%;
	color: inherit;
	text-decoration: none;
}

.articleblockbg3 {
	overflow: hidden;
	border-radius: 10px 10px 0 0;
	flex-shrink: 0;
}

.article-card__media {
	position: relative;
	width: 100%;
	aspect-ratio: 16/9;
	overflow: hidden;
}

.article-card__image {
	position: absolute;
	inset: 0;
	width: 100%;
	height: 100%;
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
	flex: 1;
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
	height: 4.5em;
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
	line-height: 1.3;
	height: 2.6em;
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

.article-body iframe {
	width: 100%;
	aspect-ratio: 16/9;
	height: auto;
	border: none;
	border-radius: 10px;
	display: block;
	margin: 28px 0;
}

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

.gap-2 {
	gap: 0.5rem !important;
}

.gap-3 {
	gap: 1rem !important;
}

.gap-4 {
	gap: 1.5rem !important;
}

.vr {
	display: inline-block !important;
	align-self: stretch !important;
	width: 1px !important;
	min-height: 1em !important;
	background-color: currentcolor !important;
	opacity: .25 !important;
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
		<img class="article-hero__image"
			src="${constant.imgContext}${path}"
			alt="${not empty alt_name ? alt_name : blog.topic}">
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
			<h1 itemprop="headline" class="article-title">${blog.topic}</h1>

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
		relatedBlogs is manually curated by editors (article_related table) -
		may genuinely be empty for articles nobody has linked yet, so this
		whole section just doesn't render rather than showing an empty
		heading (was falling back to latestBlogs before to avoid that, but
		that's its own real section below now instead of a stand-in here).
		No more end="2" cap either - see ArticleRelatedDAOImpl, the query
		itself no longer caps at 3, and this is a scrollable row now
		instead of a fixed 3-card grid, so there's no layout reason to cap
		it in the JSP either.
	--%>
	<c:if test="${not empty relatedBlogs}">
		<section class="related-articles-section">
			<h2 class="related-articles-section__heading">
				<font color="gray">บทความที่เกี่ยวข้อง</font>
			</h2>

			<div class="card-carousel">
				<button type="button"
					class="card-carousel__nav card-carousel__nav--prev"
					aria-label="เลื่อนดูก่อนหน้า">
					<i class="bi bi-chevron-left"></i>
				</button>
				<div class="card-carousel__track">
					<c:forEach var="relatedBlog" items="${relatedBlogs}"
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
						<div class="card-carousel__item">
							<comp:blogCard blog="${relatedBlog}" constant="${constant}"
								excerpt="${relatedBlogPreviewText}" />
						</div>
					</c:forEach>
				</div>
				<button type="button"
					class="card-carousel__nav card-carousel__nav--next"
					aria-label="เลื่อนดูถัดไป">
					<i class="bi bi-chevron-right"></i>
				</button>
			</div>
		</section>
	</c:if>

	<%--
		Separate from "related" above - this is just "everything recently
		published", same maxLatestBlog cap (10) and data (latestBlogs) the
		legacy page's own "บทความล่าสุด" section already uses (see
		pages-front/blog/blog_detail.jsp), so this mirrors that rather than
		inventing new scope/limits. Smaller dedicated card (.latest-card,
		not blogCard.tag) - image + title only, no excerpt/meta, matching
		what was asked for (a lighter card, not a shrunk copy of the
		related-articles one). data-aos fade-up with a per-card stagger for
		the "fades in gently" ask - reusing AOS (already loaded + .init()'d
		on this page) rather than hand-rolling a second fade system.
	--%>
	<c:if test="${not empty latestBlogs}">
		<section class="related-articles-section">
			<h2 class="related-articles-section__heading">
				<font color="gray">บทความล่าสุด</font>
			</h2>

			<div class="card-carousel">
				<button type="button"
					class="card-carousel__nav card-carousel__nav--prev"
					aria-label="เลื่อนดูก่อนหน้า">
					<i class="bi bi-chevron-left"></i>
				</button>
				<div class="card-carousel__track">
					<c:forEach var="latestBlog" items="${latestBlogs}"
						varStatus="Count" end="${maxLatestBlog - 1}">
						<div class="latest-card" data-aos="fade-up"
							data-aos-delay="${(Count.count - 1) * 60}">
							<a href="${latestBlog.page_uri_id}" class="latest-card__link">
								<div class="latest-card__media">
									<img class="latest-card__image"
										src="${constant.imgContext}${latestBlog.path}"
										alt="${latestBlog.topic}" loading="lazy">
								</div> <span class="latest-card__title">${latestBlog.topic}</span>
							</a>
						</div>
					</c:forEach>
				</div>
				<button type="button"
					class="card-carousel__nav card-carousel__nav--next"
					aria-label="เลื่อนดูถัดไป">
					<i class="bi bi-chevron-right"></i>
				</button>
			</div>
		</section>
	</c:if>

	<div class="related-articles-section__cta">
		<a href="${pageURI}" class="related-articles-section__cta-btn"> <span
			class="related-articles-section__cta-btn-text">ดูบทความทั้งหมด</span>
			<i class="bi bi-arrow-right related-articles-section__cta-btn-icon"></i>
		</a>
	</div>
</div>

<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	AOS.init();

	function animateScrollLeft(el, toLeft, duration) {
		var fromLeft = el.scrollLeft;
		var distance = toLeft - fromLeft;
		var startTime = null;
		function easeOutCubic(t) {
			return 1 - Math.pow(1 - t, 3);
		}
		function step(timestamp) {
			if (startTime === null) {
				startTime = timestamp;
			}
			var progress = Math.min((timestamp - startTime) / duration, 1);
			el.scrollLeft = fromLeft + distance * easeOutCubic(progress);
			if (progress < 1) {
				requestAnimationFrame(step);
			}
		}
		requestAnimationFrame(step);
	}

	document.querySelectorAll('.card-carousel').forEach(
			function(carousel) {
				var track = carousel.querySelector('.card-carousel__track');
				var prevBtn = carousel
						.querySelector('.card-carousel__nav--prev');
				var nextBtn = carousel
						.querySelector('.card-carousel__nav--next');
				if (!track) {
					return;
				}
				function scrollByOneCard(direction) {
					var firstCard = track.firstElementChild;
					var cardWidth = firstCard ? firstCard
							.getBoundingClientRect().width : 300;
					var gap = 20;
					var maxScrollLeft = track.scrollWidth - track.clientWidth;
					var target = track.scrollLeft + (cardWidth + gap)
							* direction;
					target = Math.max(0, Math.min(target, maxScrollLeft));
					animateScrollLeft(track, target, 420);
				}

				function updateNavState() {
					var maxScrollLeft = track.scrollWidth - track.clientWidth;
					var canScroll = maxScrollLeft > 1;
					if (prevBtn) {
						prevBtn.disabled = !canScroll || track.scrollLeft <= 1;
					}
					if (nextBtn) {
						nextBtn.disabled = !canScroll
								|| track.scrollLeft >= maxScrollLeft - 1;
					}
				}
				if (prevBtn) {
					prevBtn.addEventListener('click', function() {
						scrollByOneCard(-1);
					});
				}
				if (nextBtn) {
					nextBtn.addEventListener('click', function() {
						scrollByOneCard(1);
					});
				}
				track.addEventListener('scroll', updateNavState, {
					passive : true
				});
				window.addEventListener('resize', updateNavState);
				updateNavState();
			});

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
