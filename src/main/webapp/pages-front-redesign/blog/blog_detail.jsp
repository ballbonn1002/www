<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="comp"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.cubesofttech.util.ArticleHtmlSanitizer"%>

<c:if test="${!empty path}">
<link rel="preload" as="image" href="${constant.imgContext}${path}">
</c:if>

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

<link rel="stylesheet" href="/pages-front-redesign/assets/css/blog.css">
<style>
/* ==========================================================================
   1. Page chrome - resets body's scrollbar-compensation padding after the
   hero image modal closes (baseLayout.jsp already covers scroll-behavior
   and #navbar-hover:hover sitewide)
   ========================================================================== */
body, html {
	padding-right: 0 !important;
}

/* ==========================================================================
   2. Article hero (image + expand modal)
   ========================================================================== */
.article-hero {
	position: relative;
	z-index: 0;
	height: 480px;
	overflow: hidden;
	background-color: #1A1A1A;
	padding: calc(3% + var(--navbar-offset, 65px));
}

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

.article-hero__image,
.latest-card__image {
	opacity: 0;
	transition: opacity 0.25s ease;
}

.article-hero__image.is-loaded,
.latest-card__image.is-loaded {
	opacity: 1;
}

@media (prefers-reduced-motion: reduce) {
	.article-hero__image,
	.latest-card__image {
		transition: none;
	}
}

.article-hero__expand-btn {
	position: absolute;
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
	/* Suppresses iOS Safari's long-press "Save Image" callout menu on this preview image. */
	-webkit-touch-callout: none;
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
	.article-hero__image {
		object-fit: cover;
	}
}

.article-hero-card {
	position: relative;
	z-index: 1;
	margin-top: -140px;
	border-radius: 16px;
	background-color: #fff;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
	padding: 30px 20px;
}

.article-title {
	color: var(--article-accent);
	font-weight: 700;
	font-size: clamp(1.75rem, 1.4rem + 1.45vw, 2.5rem);
}

/* Undoes blog.css's .ardetail__meta column stacking, leaked in from the carousel. */
.article-meta-bar__info .ardetail__meta {
	flex-direction: row !important;
	align-items: center !important;
}

@media ( max-width : 767px) {
	.article-hero-card {
		margin-top: -80px;
	}
	/* Overrides Bootstrap's !important .align-items-center utility class. */
	.article-meta-bar {
		flex-direction: column;
		align-items: flex-start !important;
	}
	.article-meta-bar__info {
		flex-direction: column;
		align-items: flex-start !important;
	}
}

/* ==========================================================================
   3. Legacy global resets (unscoped - verify before editing elsewhere)
   ========================================================================== */
h1, h2, h3, h4, h5, h6 {
	/* No font-family - baseLayout.jsp's !important h1-h6 rule always wins. */
	font-weight: 400;
	margin: 10px 0;
}

h5 {
	font-size: 18px;
}

p {
	margin: 0 0 0;
}

/* ==========================================================================
   4. Article content container width
   ========================================================================== */
.article-content {
	margin: 0 auto;
}

@media ( min-width : 768px) {
	.article-content {
		max-width: 720px;
	}
}

/* ==========================================================================
   5. Related articles section
   ========================================================================== */
.related-articles-section {
	padding-top: 1.5rem;
	border-top: 1px solid var(--article-border, #E7DEDE);
}

.related-articles-section__heading {
	color: var(--article-ink-muted);
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
	border: 3px solid var(--brand-red);
	border-radius: 10px;
	color: var(--brand-red) !important;
	background-color: transparent;
	font-weight: 600;
	text-decoration: none;
	transition: color 0.3s ease;
}

.related-articles-section__cta-btn::before {
	content: "";
	position: absolute;
	background-color: var(--brand-red);
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
   6. Card carousel - shared by "related articles" and "latest articles"
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
	/* overflow-x:auto forces overflow-y:auto too - clearance for the hover-lift shadow. */
	padding: 1.25rem 0.25rem 0.75rem;
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
	color: var(--brand-red);
	font-size: 18px;
	cursor: pointer;
	z-index: 2;
	transition: background-color 0.2s ease, color 0.2s ease;
}

.card-carousel__nav:hover {
	background-color: var(--brand-red);
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

/* ==========================================================================
   7. Article-card component tuning (extends shared blog.css card for this page)
   ========================================================================== */
.article-tags {
	margin: 0.75rem 0;
}

.card-carousel__item .articleblockbg2 {
	height: 100%;
	display: flex;
	flex-direction: column;
}

.card-carousel__item .articleblockbg2__link,
.card-carousel__item .articleblockbg2__link:hover {
	display: flex;
	flex-direction: column;
	height: 100%;
}

.articleblockbg3 {
	flex-shrink: 0;
}

.article-card__media {
	overflow: hidden;
}

.ardetail {
	flex: 1;
}


/* ==========================================================================
   8. Article theme tokens
   ========================================================================== */
:root {
	--article-ink: #2B2222;
	--article-ink-muted: #7A6C6C;
	--article-accent: var(--brand-red);
	--article-accent-strong: var(--brand-red-dark);
	--article-accent-soft: #F7E6E6;
	--article-border: #E7DEDE;
	--article-surface-soft: #FAF6F6;
	--article-code-ink: #8A2A2C;
}

/* ==========================================================================
   9. Article body - styles the sanitized CMS content (headings, links,
   lists, blockquote, code, images, tables, FAQ)
   ========================================================================== */
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

.article-body hr {
	border: none;
	border-top: 1px solid var(--article-border);
	margin: 40px 0;
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

/* ==========================================================================
   10. Bootstrap 5 gap polyfill for article-meta-bar/article-shares - the
   grid/carousel card's gap-4 and vr are covered by blog.css instead.
   ========================================================================== */
.gap-2 {
	gap: 0.5rem !important;
}

.gap-3 {
	gap: 1rem !important;
}
</style>

<comp:scrollToTopButton />

<div class="article-hero"
	<c:if test="${!empty path}">style="--hero-image: url('${constant.imgContext}${path}');"</c:if>>
	<c:if test="${!empty path}">
		<img class="article-hero__image" src="${constant.imgContext}${path}"
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
		<div class="article-hero-card">
			<h1 itemprop="headline" class="article-title">${blog.topic}</h1>

			<div class="article-tags">
				Tags : <span id="articletag" style="color: var(--article-accent);"> <c:forEach
							var="tag" items="${tags}" varStatus="Count">${tag.name} </c:forEach>
				</span>
			</div>

			<div
				class="article-meta-bar d-flex flex-wrap align-items-center justify-content-between gap-3">
				<div
					class="article-meta-bar__info d-flex flex-wrap align-items-center gap-3">
					<c:if test="${not empty authorName}">
						<div
							class="ardetail__meta d-flex align-items-center gap-2 text-secondary small">
							<i class="bi bi-pencil-square"></i> <span>By ${authorName}</span>
						</div>
					</c:if>
					<c:if test="${blog.timeUpdate != null}">
						<div
							class="ardetail__meta d-flex align-items-center gap-2 text-secondary small">
							<i class="bi bi-calendar3"></i> <span>Last Update : <fmt:formatDate
									pattern="d MMMM yyyy" value="${blog.timeUpdate}" /></span>
						</div>
					</c:if>
					<div
						class="ardetail__meta d-flex align-items-center gap-2 text-secondary small">
						<i class="bi bi-eye"></i> <span><fmt:formatNumber
								value="${blog.viewCount}" pattern="#,##0" /> views</span>
					</div>
				</div>

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
					<span style="position: relative; display: inline-flex;">
						<button type="button" id="copyLinkBtn" class="copy-link-btn"
							data-share-url="https://www.cubesofttech.com${bloguri}"
							aria-label="Copy link">
							<i class="bi bi-link-45deg" style="font-size: 28px;"></i>
						</button>
						<span id="copyLinkTooltip" class="copy-link-tooltip">Copied
							link!</span>
					</span>
				</div>
			</div>
		</div>

		<style>
		.copy-link-btn, .copy-link-btn:focus, .copy-link-btn:hover {
			border: none;
			background: none;
			padding: 0;
			line-height: 0;
			cursor: pointer;
			outline: none;
			box-shadow: none;
			color: #212529;
		}

		.copy-link-tooltip {
			position: absolute;
			bottom: 100%;
			left: 50%;
			transform: translateX(-50%);
			margin-bottom: 8px;
			background: #212529;
			color: #fff;
			font-size: 12px;
			font-weight: 600;
			white-space: nowrap;
			padding: 4px 10px;
			border-radius: 6px;
			opacity: 0;
			pointer-events: none;
			transition: opacity 0.2s ease;
		}

		.copy-link-tooltip.is-visible {
			opacity: 1;
		}
		</style>

		<script type="text/javascript">
			(function() {
				var btn = document.getElementById('copyLinkBtn');
				var tooltip = document.getElementById('copyLinkTooltip');
				if (!btn) {
					return;
				}
				btn.addEventListener('click', function() {
					var url = btn.getAttribute('data-share-url');
					navigator.clipboard.writeText(url).then(function() {
						var icon = btn.querySelector('i');
						icon.classList.remove('bi-link-45deg');
						icon.classList.add('bi-check-lg');
						tooltip.classList.add('is-visible');
						setTimeout(function() {
							icon.classList.remove('bi-check-lg');
							icon.classList.add('bi-link-45deg');
							tooltip.classList.remove('is-visible');
						}, 1500);
					});
				});
			})();
		</script>

		<article itemscope itemtype="https://schema.org/Article">
			<section itemprop="articleBody" class="article-body">${cleanDetail}</section>
		</article>
	</div>

	<c:if test="${not empty relatedBlogs}">
		<section class="related-articles-section">
			<h2 class="related-articles-section__heading">
				บทความที่เกี่ยวข้อง
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

	<c:if test="${not empty latestBlogs}">
		<section class="related-articles-section">
			<h2 class="related-articles-section__heading">
				บทความล่าสุด
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

<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		AOS.init();
	});

	document.querySelectorAll(
			'.article-hero__image, .latest-card__image')
			.forEach(function(img) {
				function reveal() {
					img.classList.add('is-loaded');
				}
				if (img.complete) {
					reveal();
				} else {
					img.addEventListener('load', reveal);
					img.addEventListener('error', reveal);
				}
			});

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
					var gap = parseFloat(getComputedStyle(track).columnGap) || 20;
					var maxScrollLeft = track.scrollWidth - track.clientWidth;
					var target = track.scrollLeft + (cardWidth + gap)
							* direction;
					target = Math.max(0, Math.min(target, maxScrollLeft));
					track.scrollTo({
						left : target,
						behavior : 'smooth'
					});
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

	document.addEventListener('DOMContentLoaded', function() {
		$('#heroImageModal').on('hidden.bs.modal', function() {
			$('body').css('padding-right', '');
			$('.modal-backdrop').remove();
			// iOS ignores the outline/:focus-visible CSS on the returned focus - drop it entirely.
			var expandBtn = document.querySelector('.article-hero__expand-btn');
			if (expandBtn) {
				expandBtn.blur();
			}
		});
	});
</script>
