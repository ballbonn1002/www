<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.cubesofttech.util.ArticleHtmlSanitizer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="comp"%>

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

<link rel="stylesheet" href="/pages-front-redesign/assets/css/blog.css">

<style type="text/css">
/* ==========================================================================
   Blog list page (page-specific - not shared with blog_detail.jsp)
   ========================================================================== */
.articleblockbg figure {
	margin: 0;
}

.articleblockbg .gap-2 {
	gap: 0.5rem !important;
}
.articleblockbg .gap-4 {
	gap: 1.5rem !important;
}

.articleblockbg .vr {
	display: inline-block !important;
	align-self: stretch !important;
	width: 1px !important;
	min-height: 1em !important;
	background-color: currentcolor !important;
	opacity: .25 !important;
}

html, body {
	margin: 0;
	padding: 0;
	min-height: 100%;
}

.articleblockbg {
	background-color: #F5F5F5;
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-bottom: 5%;
	padding-left: 10%;
	padding-right: 10%;
}

/* ==========================================================================
   Article list + pagination (rendered via blog_list.jsp include)
   ========================================================================== */
.article-list-row {
	padding-top: 60px;
	scroll-margin-top: 80px;
}

.pagination.blog-pagination {
	position: static;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin-top: 2rem;
}

.blog-pagination .page-item {
	margin: 0 4px;
}

.blog-pagination .page-link {
	margin-left: 0; /* cancel Bootstrap's default -1px border-collapse between items */
	border-radius: 8px;
	border-color: #e9dcdc;
	color: var(--brand-red);
	transition: background-color 0.2s ease, color 0.2s ease;
}

.blog-pagination .page-link:hover {
	background-color: #fdeceb;
	color: #8f1a1d;
}

.blog-pagination .page-item.active .page-link {
	background-color: #f3c9c9;
	border-color: #f3c9c9;
	color: #7a1215;
	font-weight: 600;
}

.blog-pagination .page-item.disabled .page-link {
	opacity: 0.5;
}

.page-link__icon {
	display: none;
}

@media (max-width: 575px) {
	.page-link__text {
		display: none;
	}
	.page-link__icon {
		display: inline;
	}

	.blog-pagination .page-item {
		margin: 0 2px;
	}
	.blog-pagination .page-link {
		padding: 0.375rem 0.6rem;
	}
}

/* ==========================================================================
   Featured article (hero card)
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

/* Side by side from tablet up - was lg-only, stacking when there was room. */
@media ( min-width : 768px) {
	.article-preview__row .col-md-6 {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%;
		height: 500px;
	}

}

.article-preview__media {
	position: sticky;
	top: 20px;
	height: 100%;
}

.article-preview__image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 10px;
	display: block;
}

.article-preview__content {
	min-height: 400px;
	display: flex;
	flex-direction: column;
	text-align: left;
	height: 100%;
	overflow: hidden;
}

@media (max-width: 767px) {
	.article-preview__content {
		margin-top: 1.5rem;
	}
}

.article-preview__title {
	width: 100%;
	font-weight: bold;
	margin: 0 0 1rem 0;
	background: linear-gradient(135deg, var(--brand-red) 0%, var(--brand-red-dark) 100%);
	-webkit-background-clip: text;
	background-clip: text;
	-webkit-text-fill-color: transparent;
	color: var(--brand-red);
}

@media ( min-width : 992px) {
	.article-preview__title {
		font-size: 36px;
		line-height: 48px;
	}
}

.article-preview__excerpt {
	margin: 0 0 1rem 0;
	line-height: 1.6;
	height: 9.6em;
	display: -webkit-box;
	-webkit-line-clamp: 6;
	-webkit-box-orient: vertical;
	overflow: hidden;
	position: relative;
}

.article-preview__excerpt::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 3em;
	background: linear-gradient(to bottom, rgba(245, 245, 245, 0),
		rgba(245, 245, 245, 1));
	pointer-events: none;
}

.article-preview__cta.btn-danger {
	color: #fff;
	background-color: var(--brand-red);
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
	margin-top: auto;
	border-radius: 10px !important;
	color: #fff !important;
}

.article-preview__divider {
	border-top: 1px solid #B2B2B2;
	opacity: 1;
}

.article-preview__meta {
	font-size: clamp(11px, 8.14px + 0.89vw, 15px);
}

.article-preview__meta-date-full,
.article-preview__meta-date-short,
.article-preview__meta-views {
	white-space: nowrap;
}

.article-preview__meta-date-short {
	display: none;
}

@media (max-width: 1200px) {
	.article-preview__meta {
		flex-wrap: nowrap !important;
	}
	/* .articleblockbg .gap-4 has 2-class + !important specificity (blog.css's BS4 gap polyfill) */
	.articleblockbg .article-preview__meta.gap-4 {
		gap: 0.5rem !important;
	}
	.article-preview__meta-date-full {
		display: none;
	}
	.article-preview__meta-date-short {
		display: inline;
	}
	.article-preview__meta-author {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		max-width: 140px;
	}
}

/* 768-1200px squeeze (col-md-6 50% split) needs a smaller clamp than the base one above */
@media (min-width: 768px) and (max-width: 1200px) {
	.article-preview__meta {
		font-size: clamp(11.5px, 8.8px + 0.35vw, 13px);
	}
}

/* Featured article sits above the fold, so AOS's default 100px fade-up travel is too big a jump on arrival - shorten it here. */
.article-preview [data-aos="fade-up"] {
	transform: translate3d(0, 20px, 0);
}

.article-preview [data-aos="fade-up"].aos-animate {
	transform: translate3d(0, 0, 0);
}

/* ==========================================================================
   Image loading skeleton (featured article image only)
   ========================================================================== */
.articleblockbg .img-skeleton {
	position: absolute;
	inset: 0;
	border-radius: inherit;
	background: linear-gradient(100deg, #e9e9e9 30%, #f5f5f5 50%, #e9e9e9 70%);
	background-size: 200% 100%;
	animation: img-skeleton-shimmer 1.4s ease-in-out infinite;
	transition: opacity 0.25s ease;
}

.articleblockbg .img-skeleton.is-hidden {
	opacity: 0;
	pointer-events: none;
}

@keyframes img-skeleton-shimmer {
	0% { background-position: 200% 0; }
	100% { background-position: -200% 0; }
}

.articleblockbg .article-preview__image,
.articleblockbg .article-card__image {
	opacity: 0;
	transition: opacity 0.3s ease;
}

.articleblockbg .article-preview__image.is-loaded,
.articleblockbg .article-card__image.is-loaded {
	opacity: 1;
}

@media (prefers-reduced-motion: reduce) {
	.articleblockbg .img-skeleton {
		animation: none;
	}
	.articleblockbg .article-preview__image,
	.articleblockbg .article-card__image {
		transition: none;
	}
}
</style>

<div class="articleblockbg">
	<c:set var="pageLabel" value="" />
	<c:if test="${fn:contains(requestURI, 'blog')}">
		<c:set var="pageLabel" value="Blog" />
	</c:if>
	<c:if test="${fn:contains(requestURI, 'news')}">
		<c:set var="pageLabel" value="News" />
	</c:if>

	<%
	Object newBlogRaw = request.getAttribute("newBlog");

	String rawDetail = "";
	if (newBlogRaw instanceof Map) {
		Object detail = ((Map) newBlogRaw).get("detail");
		rawDetail = detail != null ? detail.toString() : "";
	}
	
	request.setAttribute("cleanDetail", ArticleHtmlSanitizer.toPreviewText(rawDetail, 500));
	%>

	<comp:pageHeader label="${pageLabel}" />
	<article class="article-preview" id="articledetail1">
		<div class="row article-preview__row">

			<div class="col-12 col-md-6 order-md-2">
				
				<figure class="article-preview__media" data-aos="fade-up">
					<a href="${newBlog.page_uri_id}" class="article-preview__link"
						aria-label="อ่านบทความ: ${newBlog.topic}"> <span
						class="img-skeleton" aria-hidden="true"></span> <img
						class="article-preview__image"
						src="${constant.imgContext}/${newBlog.path}"
						alt="${newBlog.topic}" width="805" height="475"
						fetchpriority="high">
					</a>
				</figure>
			</div>

			<div class="col-12 col-md-6 order-md-1">
				<div class="article-preview__content">
					<h2 class="article-preview__title" data-aos="fade-up"
						data-aos-delay="100">${newBlog.topic}</h2>

					<div class="article-preview__excerpt" data-aos="fade-up"
						data-aos-delay="200">${cleanDetail}</div>

					<hr class="my-4 article-preview__divider" data-aos="fade-up"
						data-aos-delay="250">

					<div
						class="article-preview__meta d-flex align-items-center flex-wrap gap-4 text-secondary mb-4 small"
						data-aos="fade-up" data-aos-delay="250">
						<div class="d-flex align-items-center gap-2">
							<i class="bi bi-calendar3"></i>
							<span class="article-preview__meta-date-full"><fmt:formatDate
									pattern="d MMMM yyyy" value="${newBlog.time_post}" /></span>
							<span class="article-preview__meta-date-short"><fmt:formatDate
									pattern="d MMM yy" value="${newBlog.time_post}" /></span>
						</div>

						<div class="vr"></div>

						<div class="d-flex align-items-center gap-2">
							<i class="bi bi-pencil-square"></i> <span
								class="article-preview__meta-author">By
								${newBlog.name}</span>
						</div>

						<div class="vr"></div>

						<div class="d-flex align-items-center gap-2">
							<i class="bi bi-eye"></i>
							<span class="article-preview__meta-views">
								<c:choose>
									<c:when test="${newBlog.view_count >= 1000000}">
										<fmt:formatNumber value="${newBlog.view_count / 1000000}" maxFractionDigits="1" />M
									</c:when>
									<c:when test="${newBlog.view_count >= 1000}">
										<fmt:formatNumber value="${newBlog.view_count / 1000}" maxFractionDigits="1" />K
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${newBlog.view_count}" pattern="#,##0" />
									</c:otherwise>
								</c:choose> views
							</span>
						</div>
					</div>

					<a href="${newBlog.page_uri_id}"
						class="btn btn-danger btn-lg article-preview__cta" role="button">Read
						More</a>
				</div>
			</div>

		</div>
	</article>
	<%@ include file="blog_list.jsp"%>

	<script>
		if (location.hash) {
			var target = document.querySelector(location.hash);
			if (target) {
				target.scrollIntoView();
			}
		}
	</script>

	<script>
		document.querySelectorAll(
				'.article-preview__image, .article-card__image')
				.forEach(
						function(img) {
							var skeleton = img.previousElementSibling;
							function reveal() {
								img.classList.add('is-loaded');
								if (skeleton
										&& skeleton.classList
												.contains('img-skeleton')) {
									skeleton.classList.add('is-hidden');
								}
							}
							if (img.complete) {
								reveal();
							} else {
								img.addEventListener('load', reveal);
								img.addEventListener('error', reveal);
							}
						});
	</script>
</div>

<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>

<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		AOS.init({
			once : true
		});
	});
</script>

<comp:scrollToTopButton />
