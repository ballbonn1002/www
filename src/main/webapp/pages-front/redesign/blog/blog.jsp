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

<style>
/* ==========================================================================
   1. Layout - Hero / Page header
   ========================================================================== */
html, body {
	margin: 0;
	padding: 0;
	background-color: #F5F5F5;
	/* หรือสีพื้นหลังหลักของเว็บ ให้ตรงกับ section แรก */
	min-height: 100%;
	overscroll-behavior-y: none;
	/* กัน bounce ทะลุไปเห็น background นอกหน้า (รองรับ Chrome/Edge) */
}

.articleblockbg {
	background-color: #F5F5F5;
	padding-top: 3%;
	padding-bottom: 5%;
	padding-left: 10%;
	padding-right: 10%;
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
   otherwise inherit this height unintentionally if ever rendered together).
   Wrapped in the same lg breakpoint Bootstrap itself uses for col-lg-6 -
   without this, the fixed height/50% width applied at every screen size,
   fighting Bootstrap's own mobile stacking and breaking the layout below
   992px. */
@media ( min-width : 992px) {
	.article-preview__row .col-lg-6 {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%;
		height: 500px;
	}

	/* 	.article-preview__image { */
	/* 		height: 100%; */
	/* 	} */
}

.article-preview__media {
	position: sticky;
	top: 20px;
}

.article-preview__image {
	width: 100%;
	/* 	height: auto; */
	object-fit: cover;
	border-radius: 10px;
	display: block;
}

/* Unlike the grid cards below, this image already has valid width/height
   HTML attributes (805/475) - browsers derive an aspect-ratio from those
   automatically and reserve the right box before the image loads, so
   there's no CLS bug to fix here. This block only adds the same
   shimmer/fade-in polish as the grid, layered on top of that existing
   space via position:absolute - it never resizes the box itself. */
.article-preview__skeleton {
	position: absolute;
	inset: 0;
	border-radius: 10px;
	background: linear-gradient(100deg, #e9e9e9 30%, #f5f5f5 50%, #e9e9e9 70%);
	background-size: 200% 100%;
	animation: skeleton-shimmer 1.4s ease-in-out infinite;
	transition: opacity 0.25s ease;
}

.article-preview__skeleton.is-hidden {
	opacity: 0;
}

.js-skel .article-preview__image {
	opacity: 0;
	transition: opacity 0.35s ease;
}

.js-skel .article-preview__image.is-loaded {
	opacity: 1;
}

/* Cache-hit path (setupSkeletonPlaceholders' .is-instant) - three class
   selectors here outweigh the two-class .js-skel .article-preview__image
   rule above, so this wins regardless of source order and the opacity
   jump happens with no transition at all. */
.article-preview__media.is-instant .article-preview__image,
.article-preview__media.is-instant .article-preview__skeleton {
	transition: none;
}

/* เปลี่ยนจาก height:400px + overflow:hidden ตายตัว
   มาเป็น flex column เพื่อดันปุ่มลงล่างสุดได้ */
.article-preview__content {
	position: relative; /* anchors .article-preview__content-skeleton below */
	min-height: 400px;
	display: flex;
	flex-direction: column;
	text-align: left;
	height: 85%;
}

/* Skeleton overlay for title/excerpt/meta/CTA - shown by default (no JS
   needed to appear), covers the same box the real content occupies.
   Doesn't need its own background: the real content underneath is
   opacity:0 at this point (see the .js-skel block further down), so
   there's nothing for these bars to visually compete with. */
.article-preview__content-skeleton {
	position: absolute;
	inset: 0;
	display: flex;
	flex-direction: column;
	gap: 0.75rem;
	transition: opacity 0.25s ease;
}

.article-preview__title-skeleton,
.article-preview__excerpt-skeleton,
.article-preview__meta-skeleton,
.article-preview__cta-skeleton {
	background: linear-gradient(100deg, #e9e9e9 30%, #f5f5f5 50%, #e9e9e9 70%);
	background-size: 200% 100%;
	animation: skeleton-shimmer 1.4s ease-in-out infinite;
	border-radius: 6px;
}

/* Two bars roughly matching the title's 2-line real-world wrap, second
   one shorter so it doesn't look like a single solid block. */
.article-preview__title-skeleton {
	height: 28px;
	width: 90%;
	margin-bottom: 0.5rem;
}

@media (min-width: 992px) {
	.article-preview__title-skeleton {
		height: 40px;
	}
}

.article-preview__title-skeleton--short {
	width: 55%;
}

/* Four bars for the 6-line-clamped excerpt's rough shape - not all six,
   enough to read as "several lines of text" without the overlay itself
   needing to match the real line count exactly. */
.article-preview__excerpt-skeleton {
	height: 14px;
	width: 100%;
}

.article-preview__excerpt-skeleton--short {
	width: 65%;
}

.article-preview__meta-skeleton {
	height: 14px;
	width: 35%;
	margin-top: 0.5rem;
}

.article-preview__cta-skeleton {
	height: 44px;
	width: 150px;
	border-radius: 10px;
	margin-top: auto; /* same "pinned to bottom" behavior as the real CTA */
}

/* Real content hidden behind the skeleton above until the hero image
   loads (see handleImageLoad() below, which adds .is-revealed to
   .article-preview__content) - opacity only, per every element here
   staying fully present in the DOM/View Source the whole time, so
   nothing is ever hidden from a crawler that doesn't run this JS. */
.js-skel .article-preview__content .article-preview__title,
.js-skel .article-preview__content .article-preview__excerpt,
.js-skel .article-preview__content .article-preview__divider,
.js-skel .article-preview__content .article-preview__meta,
.js-skel .article-preview__content .article-preview__cta {
	opacity: 0;
	transition: opacity 0.35s ease;
}

.js-skel .article-preview__content.is-revealed .article-preview__title,
.js-skel .article-preview__content.is-revealed .article-preview__excerpt,
.js-skel .article-preview__content.is-revealed .article-preview__divider,
.js-skel .article-preview__content.is-revealed .article-preview__meta,
.js-skel .article-preview__content.is-revealed .article-preview__cta {
	opacity: 1;
}

.js-skel .article-preview__content.is-revealed .article-preview__content-skeleton {
	opacity: 0;
	pointer-events: none;
}

/* Same cache-hit reasoning as .article-preview__media/.article-card__media
   elsewhere - if the hero image was already complete (cache hit) by the
   time this ran, there was no real wait to mask, so the whole content
   block should snap to its final state instead of visibly crossfading. */
.article-preview__content.is-instant,
.article-preview__content.is-instant .article-preview__title,
.article-preview__content.is-instant .article-preview__excerpt,
.article-preview__content.is-instant .article-preview__divider,
.article-preview__content.is-instant .article-preview__meta,
.article-preview__content.is-instant .article-preview__cta,
.article-preview__content.is-instant .article-preview__content-skeleton {
	transition: none;
}

.article-preview__title {
	width: 100%;
	font-weight: bold;
	margin: 0 0 1rem 0;
	background: linear-gradient(135deg, #BD2125 0%, #55090b 100%);
	-webkit-background-clip: text;
	background-clip: text;
	-webkit-text-fill-color: transparent;
	color: #BD2125;
	/* fallback สำหรับ browser ที่ไม่รองรับ background-clip: text */
}

@media ( min-width : 992px) {
	.article-preview__title {
		font-size: 36px;
		line-height: 48px;
	}
}

/* cleanDetail is a plain-text excerpt (see ArticleHtmlSanitizer.toPreviewText,
   called in the scriptlet above) capped at 1000 chars server-side, not raw
   rich-text HTML - so this only needs to clamp plain text, no more
   child-margin resets, heading hiding, or fade overlay for markup that no
   longer exists here. */
.article-preview__excerpt {
	margin: 0 0 1rem 0;
	line-height: 1.6;
	display: -webkit-box;
	-webkit-line-clamp: 6;
	-webkit-box-orient: vertical;
	overflow: hidden;
	position: relative;
}

/* Soft fade over the last line instead of an abrupt line-clamp cutoff -
   fades to #F5F5F5 (articleblockbg's background) since .article-preview__content
   has no background of its own and sits directly on top of it. */
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
	padding-bottom: 4rem;
	/* 	padding-left: 3%; */
	/* 	padding-right: 3%; */
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

/* Wraps the card image so its box (and therefore the space the browser
   reserves for it before the image loads) comes from aspect-ratio alone,
   never from the actual downloaded image's dimensions - this is what
   keeps CLS at 0 for this grid regardless of what size photo the CMS
   author uploaded. */
.article-card__media {
	position: relative;
	width: 100%;
	aspect-ratio: 16 / 9;
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

/* Shimmer placeholder, same box as the image above it. Only fades out
   once .js-skel is on <html> (set by the inline script right after this
   style block) and the image has actually finished loading - see
   setupSkeletonPlaceholders() below. Purely decorative (aria-hidden), so
   unlike the reveal-card content below it's fine for this to leave the
   layout flow once hidden. */
.article-card__skeleton {
	position: absolute;
	inset: 0;
	background: linear-gradient(100deg, #e9e9e9 30%, #f5f5f5 50%, #e9e9e9 70%);
	background-size: 200% 100%;
	animation: skeleton-shimmer 1.4s ease-in-out infinite;
	transition: opacity 0.25s ease;
}

.article-card__skeleton.is-hidden {
	opacity: 0;
}

@keyframes skeleton-shimmer {
	0% { background-position: 200% 0; }
	100% { background-position: -200% 0; }
}

/* Skeletons start paused - only the cards initScrollReveal has already
   marked .is-visible (on screen at load, or scrolled into view) get their
   shimmer running. Without this, all 12 grid skeletons animate at once
   from the moment the page loads, most of which the visitor can't even
   see yet - unnecessary compositor work stacking on top of everything
   else fighting for the main thread during page load. Reuses .is-visible
   rather than adding a second observer. */
.js-skel .article-card__skeleton {
	animation-play-state: paused;
}

.js-skel .reveal-card.is-visible .article-card__skeleton {
	animation-play-state: running;
}

/* Fade-in only applies once JS (.js-skel) is confirmed running - without
   it the image is visible immediately like before this feature existed,
   so a visitor or crawler with JS off never sees a permanently blank
   card. */
.js-skel .article-card__image {
	opacity: 0;
	transition: opacity 0.35s ease;
}

.js-skel .article-card__image.is-loaded {
	opacity: 1;
}

/* Same cache-hit override as the hero image above - see the comment there. */
.article-card__media.is-instant .article-card__image,
.article-card__media.is-instant .article-card__skeleton {
	transition: none;
}

@media (prefers-reduced-motion: reduce) {
	.article-card__skeleton,
	.article-preview__skeleton,
	.article-preview__title-skeleton,
	.article-preview__excerpt-skeleton,
	.article-preview__meta-skeleton,
	.article-preview__cta-skeleton {
		animation: none;
	}

	/* Matching specificity to the .js-skel-scoped rules that set these
	   transitions (see .article-preview__content above) so this actually
	   overrides them instead of losing the cascade tie - skeleton/content
	   should snap straight to their final state with no fade at all here,
	   not just a stripped-down animation. */
	.js-skel .article-preview__image,
	.js-skel .article-preview__content .article-preview__title,
	.js-skel .article-preview__content .article-preview__excerpt,
	.js-skel .article-preview__content .article-preview__divider,
	.js-skel .article-preview__content .article-preview__meta,
	.js-skel .article-preview__content .article-preview__cta,
	.article-preview__skeleton,
	.article-preview__content-skeleton {
		transition: none;
	}
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
	min-height: 200px; /* เปลี่ยนจาก height ตายตัว เป็น min-height */
	display: flex; /* ต้องมีตัวนี้ ไม่งั้น margin-top:auto ใช้ไม่ได้ */
	flex-direction: column;
}

.ardetail__meta {
	margin-top: auto;
}

/* Plain-text excerpt per card (see ArticleHtmlSanitizer.toPreviewText,
   called per-iteration in the c:forEach loop below) - same reasoning as
   .article-preview__excerpt: capped server-side, so this only needs to
   clamp plain text. */
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

/* baseLayout.jsp has its own sitewide ".pagination { position: absolute;
   right: 0; ... }" rule that careers.jsp's job listing depends on - reusing
   the bare .pagination class here would inherit that and get pulled out of
   flow to the right edge. Scoped under .blog-pagination (added alongside
   .pagination on this page's <ul> in blog_list.jsp) instead of touching the
   shared rule. */
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
	color: #BD2125;
	transition: background-color 0.2s ease, color 0.2s ease;
}

.blog-pagination .page-link:hover {
	background-color: #fdeceb;
	color: #8f1a1d;
}

/* Active page: a soft tint of the brand red (not the solid, full-strength
   #BD2125) with dark red text on top, so the page number stays legible
   instead of disappearing into a solid block. */
.blog-pagination .page-item.active .page-link {
	background-color: #f3c9c9;
	border-color: #f3c9c9;
	color: #7a1215;
	font-weight: 600;
}

.blog-pagination .page-item.disabled .page-link {
	opacity: 0.5;
}

/* ==========================================================================
   8. Scroll reveal (article cards) - progressive enhancement only, see
   initScrollReveal() below. Scoped under .js-skel and
   prefers-reduced-motion: no-preference together, so a card renders fully
   visible with zero animation whenever JS hasn't run or the visitor asked
   for reduced motion (the JS still runs in that case, it just has no CSS
   left to toggle). Only opacity/transform animate - never a property that
   triggers layout reflow. --reveal-delay is set per-card by JS for the
   stagger; cards already in the initial viewport skip it entirely (stays
   at its 0ms default).
   ========================================================================== */
@media (prefers-reduced-motion: no-preference) {
	.js-skel .article-list-row .reveal-card {
		opacity: 0;
		transform: translateY(14px);
		transition: opacity 0.35s ease, transform 0.35s ease;
		transition-delay: var(--reveal-delay, 0ms);
	}

	.js-skel .article-list-row .reveal-card.is-visible {
		opacity: 1;
		transform: translateY(0);
	}

	/* Cards already in the viewport at page load (initScrollReveal's
	   .is-instant) skip the transition entirely instead of just skipping
	   the stagger delay - they still had opacity 0.35s + transform 0.35s
	   playing on top of that same card's image doing its own
	   skeleton-to-photo crossfade at the same moment, which is what read
	   as "something stacking" on reload. Four class selectors here beat
	   the three-class base rule above regardless of source order. */
	.js-skel .article-list-row .reveal-card.is-instant {
		transition: none;
	}
}
</style>

<%-- Sets .js-skel on <html> before the grid below is parsed/painted, so the
	skeleton/reveal CSS above (both scoped under .js-skel) only ever takes
	effect when JS actually ran - with JS off, every image and card renders
	visible immediately like before this feature existed. Must stay this
	early (ahead of the grid markup) so there's no flash of a fully-opaque
	image before the skeleton CSS applies. --%>
<script>document.documentElement.classList.add('js-skel');</script>

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
		// Plain-text teaser, not clean()'s rich HTML - this excerpt is clamped
		// to 6 lines by .article-preview__excerpt's CSS, and that clamp
		// (-webkit-line-clamp + display:-webkit-box) only behaves reliably
		// against flowing text. Block-level children from clean() (<p>, and
		// especially any <img> the article body happens to embed) caused a
		// visible reflow once those async-loaded images finished - the
		// clamped box has to recompute once content it was measured against
		// changes size. Plain text has nothing left to load asynchronously,
		// so there's nothing left to reflow around.
		request.setAttribute("cleanDetail", ArticleHtmlSanitizer.toPreviewText(rawDetail, 2000));
		%>

		<comp:pageHeader label="${pageLabel}" />
		<article class="article-preview" id="articledetail1">
			<div class="row article-preview__row">

				<div class="col-12 col-lg-6 order-lg-2">
					<figure class="article-preview__media">
						<a href="${newBlog.page_uri_id}" class="article-preview__link"
							aria-label="อ่านบทความ: ${newBlog.topic}">
							<span class="article-preview__skeleton" aria-hidden="true"></span>
							<img class="article-preview__image"
							src="${constant.imgContext}/${newBlog.path}"
							alt="${newBlog.topic}" width="805" height="475"
							fetchpriority="high">
						</a>
					</figure>
				</div>

				<div class="col-12 col-lg-6 order-lg-1">
					<div class="article-preview__content">
						<%--
							Skeleton overlay for the whole content block - shown by
							default (CSS, no JS needed to appear), faded out as one
							unit together with the image once it loads (see
							setupHeroSkeleton() below). Widths vary per bar
							(full/short) on purpose so it reads as a natural
							paragraph shape instead of identical rectangles stacked
							up. aria-hidden since it's decorative - the real content
							right below it is what screen readers/crawlers see,
							unaffected by any of this (opacity only, never
							display:none, never removed from the DOM).
						--%>
						<div class="article-preview__content-skeleton" aria-hidden="true">
							<div class="article-preview__title-skeleton"></div>
							<div
								class="article-preview__title-skeleton article-preview__title-skeleton--short"></div>
							<div class="article-preview__excerpt-skeleton"></div>
							<div class="article-preview__excerpt-skeleton"></div>
							<div class="article-preview__excerpt-skeleton"></div>
							<div
								class="article-preview__excerpt-skeleton article-preview__excerpt-skeleton--short"></div>
							<div class="article-preview__meta-skeleton"></div>
							<div class="article-preview__cta-skeleton"></div>
						</div>

						<h2 class="article-preview__title">${newBlog.topic}</h2>

						<%-- 						<div class="article-preview__excerpt">${newBlog.detail}</div> --%>
						<div itemprop="articleBody" class="article-preview__excerpt">${cleanDetail}</div>

						<hr class="my-4 article-preview__divider">

						<div
							class="article-preview__meta d-flex align-items-center flex-wrap gap-4 text-secondary mb-4 small">
							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-calendar3"></i> <span><fmt:formatDate
										pattern="d MMMM yyyy" value="${newBlog.time_post}" /></span>
							</div>

							<div class="vr"></div>

							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-pencil-square"></i> <span>By
									${newBlog.name}</span>
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
	</div>

	<br>
</div>

<%--
	Deliberately its own <script> block, placed here (right after the grid
	exists) rather than after the AOS/jQuery/Cloudflare/FontAwesome <script
	src> tags below - none of those are dependencies of this code (it's
	plain vanilla JS), but a non-deferred <script src> still blocks the
	parser until it finishes loading+executing. With this block stuck after
	all four of them, every card sat at opacity:0 (see .js-skel CSS above)
	for however long those four unrelated network round-trips took, then
	all snapped visible at once the moment this code finally got to run -
	that's what read as the whole page jerking on load, not any single
	animation's timing. Running this first removes that artificial wait
	entirely.
--%>
<script type="text/javascript">
	// Swaps a shimmer placeholder for its real image once the image has
	// actually finished loading. img.complete already true (cache hit /
	// image loaded faster than this script ran) skips straight to the
	// loaded state instead of waiting on a 'load' event that already fired.
	// imageSelector is a full CSS selector for the <img> elements
	// themselves (not a container) - used for every grid card image below.
	// The hero image has its own setupHeroSkeleton() instead (further
	// down): unlike a grid card, the hero also has to reveal its title/
	// excerpt/meta/CTA in that same moment, which this function has no
	// reason to know about.
	function setupSkeletonPlaceholders(imageSelector) {
		var images = document.querySelectorAll(imageSelector);
		images.forEach(function(img) {
			var skeleton = img.previousElementSibling;
			var wrapper = img.closest('.article-card__media, .article-preview__media');

			function reveal() {
				img.classList.add('is-loaded');
				if (skeleton) {
					skeleton.classList.add('is-hidden');
				}
			}

			if (img.complete) {
				// Cache hit (common on refresh) - the image was already
				// decoded before this script even ran, so there was no real
				// wait to mask. Playing the fade+shimmer crossfade anyway
				// just reads as a flicker, not a loading transition, so skip
				// the animation and snap straight to the loaded state.
				if (wrapper) {
					wrapper.classList.add('is-instant');
				}
				reveal();
			} else {
				img.addEventListener('load', reveal);
				// A broken image link shouldn't leave the shimmer running forever.
				img.addEventListener('error', reveal);
			}
		});
	}

	// Fades each card in as it scrolls into view. Cards already visible in
	// the viewport at page load show immediately (no stagger delay) so the
	// first screenful never feels like it's waiting on an animation; cards
	// below the fold get a short stagger as they're discovered so the grid
	// doesn't reveal on top of itself all at once.
	function initScrollReveal(gridSelector) {
		var cards = document.querySelectorAll(gridSelector + ' .reveal-card');
		var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

		if (reduceMotion) {
			// The reveal CSS is scoped under prefers-reduced-motion: no-preference,
			// so it never hid these cards in the first place - nothing to do.
			return;
		}

		if (!('IntersectionObserver' in window)) {
			// No IntersectionObserver support: reveal everything immediately
			// instead of leaving cards stuck at opacity:0 forever (.js-skel's
			// CSS did hide them, since that part isn't feature-detected).
			// is-instant same as the already-in-viewport case below - there's
			// no real staged reveal happening here, so nothing should animate.
			cards.forEach(function(card) {
				card.classList.add('is-visible', 'is-instant');
			});
			return;
		}

		var viewportHeight = window.innerHeight;
		var staggerIndex = 0;

		var observer = new IntersectionObserver(function(entries, obs) {
			entries.forEach(function(entry) {
				if (!entry.isIntersecting) {
					return;
				}
				entry.target.classList.add('is-visible');
				obs.unobserve(entry.target);
			});
		}, { threshold: 0.3 });

		cards.forEach(function(card) {
			var rect = card.getBoundingClientRect();
			var alreadyInViewport = rect.top < viewportHeight && rect.bottom > 0;
			if (alreadyInViewport) {
				// No transition here - this card is already on screen, so
				// there's nothing to reveal. Its image may still be running
				// its own skeleton-to-photo crossfade at this same moment;
				// animating the whole card on top of that read as jank on
				// reload, not a smooth reveal.
				card.classList.add('is-visible', 'is-instant');
				return;
			}
			card.style.setProperty('--reveal-delay', (staggerIndex * 70) + 'ms');
			staggerIndex++;
			observer.observe(card);
		});
	}

	// Hero-specific: reveals the image AND the title/excerpt/meta/CTA
	// skeleton overlay together, in one moment, rather than just the image
	// like setupSkeletonPlaceholders does for grid cards. Split into three
	// named functions (setup/load/error) rather than one block, matching
	// how setupSkeletonPlaceholders/initScrollReveal are already split
	// above.
	function setupHeroSkeleton() {
		var img = document.querySelector('#articledetail1 .article-preview__image');
		if (!img) {
			return;
		}
		if (img.complete) {
			// Cache hit - no real wait happened, so skip straight to the
			// final state instead of visibly crossfading (same reasoning
			// as setupSkeletonPlaceholders' .is-instant above).
			var wrapper = img.closest('.article-preview__media');
			if (wrapper) {
				wrapper.classList.add('is-instant');
			}
			var content = document.querySelector('#articledetail1 .article-preview__content');
			if (content) {
				content.classList.add('is-instant');
			}
			handleImageLoad(img);
		} else {
			img.addEventListener('load', function() {
				handleImageLoad(img);
			});
			img.addEventListener('error', function() {
				handleImageError(img);
			});
		}
	}

	function handleImageLoad(img) {
		img.classList.add('is-loaded');
		var skeleton = img.previousElementSibling;
		if (skeleton) {
			skeleton.classList.add('is-hidden');
		}
		var content = document.querySelector('#articledetail1 .article-preview__content');
		if (content) {
			content.classList.add('is-revealed');
		}
	}

	function handleImageError(img) {
		// The <img> itself falls back to the browser's own broken-image
		// treatment (icon + alt text) - not something to fix here. What
		// this function owns is making sure a failed image doesn't leave
		// the title/excerpt/meta/CTA stuck behind their skeleton forever:
		// same reveal as a successful load.
		handleImageLoad(img);
	}

	setupHeroSkeleton();
	setupSkeletonPlaceholders('#articledetail .article-card__image');
	initScrollReveal('#articledetail');
</script>

<%--
	aos.css/aos.js and jQuery both already load once in baseLayout.jsp's
	<head> (every page shares it) - this page had its own second copy of
	both. Safe to drop here specifically (checked first): this page has
	zero data-aos elements anyway (the grid/hero use the custom
	skeleton+reveal system instead), and no $.ajax/.load/effects calls.
	AOS.init() below still needs to stay - baseLayout.jsp only loads the
	library, each page still calls .init() itself.
--%>
<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	AOS.init();

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
