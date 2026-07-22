<%@ tag pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ attribute name="blog" required="true" type="java.lang.Object"%>
<%@ attribute name="constant" required="true" type="java.lang.Object"%>
<%@ attribute name="excerpt" required="false" type="java.lang.String"%>
<%@ attribute name="eager" required="false" type="java.lang.Boolean"%>

<%--
	Shared card: blog.jsp's grid + blog_detail.jsp's related/latest
	sidebars. "blog" is a Map (AliasToEntityMapResultTransformer), keyed
	by topic/path/page_uri_id/time_post/name/view_count. No grid-column
	wrapper (col-*) - that's the caller's decision, not this card's.
--%>
<div class="articleblockbg2">
	<a href="${blog.page_uri_id}" class="articleblockbg2__link">
		<div class="articleblockbg3">
			<%-- article-card__media/img-skeleton CSS only exists in blog.css (blog.jsp) - inert on blog_detail.jsp's sidebar, which doesn't load that file. eager marks the grid's first row for fetchpriority="high". --%>
			<div class="article-card__media">
				<span class="img-skeleton" aria-hidden="true"></span>
				<%-- width/height are a 16:9 intrinsic-ratio hint (must be plain integers, not "100%"/"250px") - actual size is 100% via CSS either way. --%>
				<img class="article-card__image"
					src="${constant.imgContext}${blog.path}" width="320"
					height="180" alt="${blog.topic}"
					<c:if test="${eager}">fetchpriority="high"</c:if>
					<c:if test="${!eager}">loading="lazy"</c:if>>
				<%-- Overlaid on the image, not in .ardetail__meta - kept a 3rd meta item from wrapping onto a 2nd line on some cards but not others. --%>
				<span class="article-card__views-badge">
					<i class="bi bi-eye"></i> <fmt:formatNumber
						value="${blog.view_count}" pattern="#,##0" />
				</span>
			</div>
		</div>
		<div class="ardetail">
			<h3 class="aum text-ellipsis-2">${blog.topic}</h3>
			<c:if test="${not empty excerpt}">
				<div class="ardetail__excerpt">${excerpt}</div>
			</c:if>
			<div
				class="ardetail__meta d-flex align-items-center flex-wrap gap-4 text-secondary small">
				<div class="d-flex align-items-center gap-2">
					<i class="bi bi-calendar3"></i> <span><fmt:formatDate
							pattern="d MMMM yyyy" value="${blog.time_post}" /></span>
				</div>
				<div class="vr"></div>
				<div class="d-flex align-items-center gap-2">
					<i class="bi bi-pencil-square"></i> <span>By ${blog.name}</span>
				</div>
			</div>
		</div>
	</a>
</div>
