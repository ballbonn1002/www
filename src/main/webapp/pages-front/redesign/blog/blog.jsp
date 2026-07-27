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

			<div class="col-12 col-lg-6 order-lg-2">
				
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

			<div class="col-12 col-lg-6 order-lg-1">
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
							<i class="bi bi-calendar3"></i> <span><fmt:formatDate
									pattern="d MMMM yyyy" value="${newBlog.time_post}" /></span>
						</div>

						<div class="vr"></div>

						<div class="d-flex align-items-center gap-2">
							<i class="bi bi-pencil-square"></i> <span>By
								${newBlog.name}</span>
						</div>

						<div class="vr"></div>

						<div class="d-flex align-items-center gap-2">
							<i class="bi bi-eye"></i> <span><fmt:formatNumber
									value="${newBlog.view_count}" pattern="#,##0" /> views</span>
						</div>
					</div>

					<a href="${newBlog.page_uri_id}"
						class="btn btn-danger btn-lg article-preview__cta" role="button"
						data-aos="fade-up" data-aos-delay="250">Read More</a>
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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	AOS.init({
		once : true
	});

	function showNav() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}

</script>

<comp:scrollToTopButton />
