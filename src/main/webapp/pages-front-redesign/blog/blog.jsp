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
      "name": "${fn:contains(requestURI, 'news') ? 'Cube SoftTech News' : 'Cube SoftTech Blog'}",
      "item": "${constant.webPath}${fn:contains(requestURI, 'news') ? '/news' : '/blog'}"
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
.article-list-heading {

	margin: clamp(56px, 24px + 4vw, 96px) 0 24px;
	font-size: clamp(22px, 1rem + 1vw, 28px);
	font-weight: bold;
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
	margin-left: 0;
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
	container-type: inline-size;
}

.article-preview__row {
	display: grid;
	grid-template-areas: "media" "content";
	gap: 24px;
}

.article-preview__col-media {
	grid-area: media;
	min-width: 0;
}

.article-preview__col-content {
	grid-area: content;
	min-width: 0;
}

@container (min-width: 900px) {
	.article-preview__row {
		grid-template-columns: minmax(0, 5fr) minmax(0, 7fr);
		grid-template-areas: "content media";
		column-gap: clamp(24px, 3cqi, 48px);
		align-items: center;
	}
}

.article-preview__media {
	position: relative;
	aspect-ratio: 1200 / 630;
	overflow: hidden;
	border-radius: 10px;
	background-color: #ffffff;
}

.article-preview__image {
	position: absolute;
	inset: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

.article-preview__content {
	display: grid;
	grid-template-columns: auto minmax(0, 1fr) auto;
	grid-template-areas:
		"meta    meta    meta"
		"title   title   title"
		"excerpt excerpt excerpt"
		"hr      hr      hr"
		"avatar  author  more";
	column-gap: 12px;
	align-items: center;
	text-align: left;
}

.article-preview__meta      { grid-area: meta; }
.article-preview__title     { grid-area: title; }
.article-preview__excerpt   { grid-area: excerpt; }
.article-preview__divider   { grid-area: hr; }
.article-preview__byline    { display: contents; }
.article-preview__avatar    { grid-area: avatar; }
.article-preview__author    { grid-area: author; }
.article-preview__more      { grid-area: more; justify-self: end; }

.article-preview__title {
	width: 100%;
	font-weight: bold;
	font-size: clamp(22px, 12px + 1.6cqi, 36px);
	line-height: 1.35;
	margin: 0 0 1rem 0;
	background: linear-gradient(135deg, var(--brand-red) 0%, var(--brand-red-dark) 100%);
	-webkit-background-clip: text;
	background-clip: text;
	-webkit-text-fill-color: transparent;
	color: var(--brand-red);
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.article-preview__title-link,
.article-preview__title-link:hover {
	color: var(--brand-red);
	text-decoration: none;
}

.article-preview__title-link {
	background-image: linear-gradient(90deg, var(--brand-red), var(--brand-red-dark));
	background-repeat: no-repeat;
	background-position: 0 100%;
	background-size: 0% 2px;
	transition: background-size 0.6s cubic-bezier(0.2, 0.8, 0.2, 1);
}

.article-preview__excerpt {
	margin: 0 0 1rem 0;
	line-height: 1.6;
	max-height: calc(1.6em * 4);
	overflow: hidden;
	-webkit-mask-image: linear-gradient(to bottom, #000 calc(100% - 3.2em), transparent);
	mask-image: linear-gradient(to bottom, #000 calc(100% - 3.2em), transparent);
}

.article-preview__more {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	white-space: nowrap;
	color: var(--brand-red);
	font-weight: 600;

	transition: color 0.2s ease;
}

.article-preview__more:hover {
	color: #212529;
	text-decoration: none;
}

.article-preview__more .bi {
	transition: transform 0.25s ease;
}

.article-preview__media {
	transition: box-shadow 0.4s ease;
}

.article-preview .article-preview__media[data-aos] {
	transition-property: opacity, transform, box-shadow;
}

.article-preview__link:focus-visible {
	outline: 3px solid var(--brand-red);
	outline-offset: -3px;
}

.article-preview__media:hover,
.article-preview__media:focus-within {
	box-shadow: 0 18px 40px -20px rgba(0, 0, 0, 0.45);
}

.article-preview__media:hover .article-preview__image,
.article-preview__media:focus-within .article-preview__image {
	transform: scale(1.04);
}

.article-preview__title-link:hover,
.article-preview__title-link:focus-visible {
	background-size: 100% 2px;
}

.article-preview__more:focus-visible {
	color: #212529;
}

.article-preview__more:hover .bi,
.article-preview__more:focus-visible .bi {
	transform: translateX(4px);
}

.article-preview__row:has(.article-preview__title-link:hover, .article-preview__more:hover) .article-preview__media {
	box-shadow: 0 18px 40px -20px rgba(0, 0, 0, 0.45);
}

.article-preview__row:has(.article-preview__title-link:hover, .article-preview__more:hover) .article-preview__image {
	transform: scale(1.04);
}

.article-preview__row:has(.article-preview__link:hover, .article-preview__more:hover) .article-preview__title-link {
	background-size: 100% 2px;
}

.article-preview__row:has(.article-preview__link:hover, .article-preview__title-link:hover) .article-preview__more {
	color: #212529;
}

.article-preview__row:has(.article-preview__link:hover, .article-preview__title-link:hover) .article-preview__more .bi {
	transform: translateX(4px);
}

.article-preview__divider {
	width: 100%;
	border-top: 1px solid #B2B2B2;
	opacity: 1;
	margin: 0.75rem 0;
}

.article-preview__meta {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	gap: 4px 10px;
	margin-bottom: 0.5rem;
	color: #6c757d;
	font-size: 14px;
}

.article-preview__meta-item {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	white-space: nowrap;
}

.article-preview__avatar {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	display: grid;
	place-items: center;
	background-color: #ffffff;
	box-shadow: 0 0 0 2px #F3D4D5;
}

.article-preview__avatar-logo {
	display: block;
	width: 19px;
	height: 22px;
	background: url("/pages-front/img/logo/cubesofttech.png") no-repeat left center;
	background-size: auto 100%;
}

.article-preview__author {
	min-width: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	color: #212529;
	font-size: 15px;
	font-weight: 600;
}

@container (min-width: 900px) {
	.article-preview__row {
		align-items: stretch;
	}
	.article-preview__col-media {
		align-self: center;
	}
	.article-preview__content {
		height: 100%;
		grid-template-rows: auto minmax(calc(1.6em * 3 + 1rem), 1fr) auto auto auto;
		grid-template-areas:
			"title   title   title"
			"excerpt excerpt excerpt"
			"hr      hr      hr"
			"avatar  author  more"
			"avatar  meta    more";
	}

	.article-preview__excerpt {
		align-self: stretch;
		max-height: none;
		contain: size;
		-webkit-mask-image: linear-gradient(to bottom, #000 40%, transparent);
		mask-image: linear-gradient(to bottom, #000 40%, transparent);
	}

	.article-preview__meta {
		align-self: start;
		margin: 0;
		font-size: 13px;
		line-height: 1.35;
	}

	.article-preview .article-preview__meta[data-aos][data-aos].aos-animate {
		transition-delay: 0.25s;
	}
	.article-preview__author {
		align-self: end;
		line-height: 1.35;
	}
	.article-preview__avatar {
		width: 42px;
		height: 42px;
	}
	.article-preview__avatar-logo {
		width: 23px;
		height: 26px;
	}
}

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

.articleblockbg .article-preview .article-preview__image {
	transition: opacity 0.3s ease, transform 0.6s cubic-bezier(0.2, 0.8, 0.2, 1);
}

@media (prefers-reduced-motion: reduce) {
	.articleblockbg .img-skeleton {
		animation: none;
	}
	.articleblockbg .article-preview__image,
	.articleblockbg .article-card__image,
	.articleblockbg .article-preview .article-preview__image,
	.article-preview__title-link,
	.article-preview__more,
	.article-preview__more .bi {
		transition: none;
	}

	.articleblockbg .article-preview .article-preview__image,
	.articleblockbg .article-preview .article-preview__more .bi {
		transform: none !important;
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
		<div class="article-preview__row">

			<div class="article-preview__col-media">

				<figure class="article-preview__media" data-aos="fade-up">
					<a href="${newBlog.page_uri_id}" class="article-preview__link"
						aria-label="อ่านบทความ: ${newBlog.topic}"> <span
						class="img-skeleton" aria-hidden="true"></span> <img
						class="article-preview__image"
						src="${constant.imgContext}${newBlog.path}"
						alt="${newBlog.topic}" width="1200" height="630"
						fetchpriority="high">
					</a>
				</figure>
			</div>

			<div class="article-preview__col-content">
				<div class="article-preview__content">
					<div class="article-preview__meta" data-aos="fade-up"
						data-aos-delay="50">
						<span class="article-preview__meta-item"><i
							class="bi bi-calendar3" aria-hidden="true"></i><fmt:formatDate
								pattern="d MMMM yyyy" value="${newBlog.time_post}" /></span>
						<span aria-hidden="true">·</span>
						<span class="article-preview__meta-item"><i
							class="bi bi-eye" aria-hidden="true"></i>
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

					<h2 class="article-preview__title" data-aos="fade-up"
						data-aos-delay="100"><a href="${newBlog.page_uri_id}"
						class="article-preview__title-link">${newBlog.topic}</a></h2>

					<div class="article-preview__excerpt" data-aos="fade-up"
						data-aos-delay="200">${cleanDetail}</div>

					<hr class="article-preview__divider" data-aos="fade-up"
						data-aos-delay="250">

					<div class="article-preview__byline">
						<span class="article-preview__avatar" aria-hidden="true"
							data-aos="fade-up" data-aos-delay="250"><span
							class="article-preview__avatar-logo"></span></span>
						<span class="article-preview__author" data-aos="fade-up"
							data-aos-delay="250">${newBlog.name}</span>
						<a href="${newBlog.page_uri_id}" class="article-preview__more"
							aria-label="Read more: ${newBlog.topic}" data-aos="fade-up"
							data-aos-delay="250">Read more <i class="bi bi-arrow-right"
							aria-hidden="true"></i></a>
					</div>
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
