<%@ tag pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ attribute name="blog" required="true" type="java.lang.Object"%>
<%@ attribute name="constant" required="true" type="java.lang.Object"%>
<%@ attribute name="excerpt" required="false" type="java.lang.String"%>

<%--
	Shared card: used by the blog/news listing page (blog.jsp) and both
	sidebar sections on the article detail page (blog_detail.jsp - related
	articles, latest articles). "blog" is a java.util.Map (see
	ArticleHtmlSanitizer/BlogDAOImpl - these queries all use
	AliasToEntityMapResultTransformer), keyed by topic/path/page_uri_id/
	time_post/name. "excerpt" is computed by the caller (via
	ArticleHtmlSanitizer.toPreviewText) rather than sanitized in here, so
	this tag stays presentation-only with no business logic of its own.

	Deliberately doesn't include its own grid-column wrapper (col-*) -
	blog.jsp needs this 3-per-row in a full-width .row, while
	blog_detail.jsp's sidebar needs it stacked full-width in an already
	narrow column, so the grid slot is the caller's decision, not this
	card's.
--%>
<div class="articleblockbg2">
	<div class="articleblockbg3">
		<a href="${blog.page_uri_id}" role="button"> <img
			class="article-card__image" src="${constant.imgContext}${blog.path}"
			width="100%" height="250px" alt="${blog.topic}" loading="lazy">
		</a>
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
</div>
