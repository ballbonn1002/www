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

<link rel="stylesheet" href="/pages-front/redesign/assets/css/blog.css">

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
		request.setAttribute("cleanDetail", ArticleHtmlSanitizer.toPreviewText(rawDetail, 500));
		%>

		<comp:pageHeader label="${pageLabel}" />
		<article class="article-preview" id="articledetail1">
			<div class="row article-preview__row">

				<div class="col-12 col-lg-6 order-lg-2">
					<figure class="article-preview__media">
						<a href="${newBlog.page_uri_id}" class="article-preview__link"
							aria-label="อ่านบทความ: ${newBlog.topic}">
							<img class="article-preview__image"
							src="${constant.imgContext}/${newBlog.path}"
							alt="${newBlog.topic}" width="805" height="475"
							fetchpriority="high">
						</a>
					</figure>
				</div>

				<div class="col-12 col-lg-6 order-lg-1">
					<div class="article-preview__content">
						<h2 class="article-preview__title">${newBlog.topic}</h2>

						<%-- 						<div class="article-preview__excerpt">${newBlog.detail}</div> --%>
						<%-- No itemprop="articleBody" here - this is a truncated teaser
							 (see cleanDetail above), not the full article body. That
							 microdata belongs only on blog_detail.jsp's real articleBody,
							 confirmed working there via Google Rich Results Test - do not
							 add it back here or touch blog_detail.jsp. --%>
						<div class="article-preview__excerpt">${cleanDetail}</div>

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

		<%--
			#articledetail (blog_list.jsp) is already in the DOM at this point
			in parsing - no need to wait for the 'load' event (which waits on
			every image on the page finishing, and turned out unreliable here
			anyway). Runs immediately instead: the hero image already has
			explicit width/height so it doesn't reflow after this point, and
			the grid cards reserve their box via aspect-ratio (blog.css), so
			nothing below shifts the target's position after this runs either.
			scrollIntoView() still respects #articledetail's scroll-margin-top
			(blog.css, offsets the fixed navbar) and still animates smoothly
			since that's inherited from the site-wide CSS (baseLayout.jsp).
		--%>
		<script>
			if (location.hash) {
				var target = document.querySelector(location.hash);
				if (target) {
					target.scrollIntoView();
				}
			}
		</script>
	</div>

	<br>
</div>

<%--
	aos.css/aos.js and jQuery both already load once in baseLayout.jsp's
	<head> (every page shares it) - this page had its own second copy of
	both. Safe to drop here specifically (checked first): this page has
	zero data-aos elements anyway, and no $.ajax/.load/effects calls.
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
