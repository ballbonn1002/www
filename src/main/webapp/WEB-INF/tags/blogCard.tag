<%@ tag pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ attribute name="blog" required="true" type="java.lang.Object"%>
<%@ attribute name="constant" required="true" type="java.lang.Object"%>
<%@ attribute name="excerpt" required="false" type="java.lang.String"%>
<%@ attribute name="eager" required="false" type="java.lang.Boolean"%>

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
<%--
	The whole card is one link now - it used to be just the image wrapped in
	<a>, with .ardetail (title/excerpt/meta) sitting outside it as a plain
	sibling div, so clicking the text below the image did nothing even
	though .articleblockbg2 already has cursor:pointer suggesting the whole
	card is clickable. role="button" also dropped - this is a real
	navigation link, not a button, so it shouldn't override how screen
	readers announce it.
--%>
<div class="articleblockbg2">
	<a href="${blog.page_uri_id}" class="articleblockbg2__link">
		<div class="articleblockbg3">
			<%--
				.article-card__media only has an effect on blog.jsp, which
				defines its aspect-ratio CSS. blog_detail.jsp's sidebar reuses
				this same tag but never adds that CSS, so there this wrapper
				renders as an inert, unstyled element and the card looks exactly
				as it did before.
			--%>
			<%--
				eager (from the caller, defaults to false/lazy when omitted -
				blog_detail.jsp's sidebar usage never sets it) marks the first
				row of the blog list grid so it doesn't fight the rest of the
				page's same-origin images for Tomcat's HTTP/1.1 connection pool -
				see blog_list.jsp for which cards get it. fetchpriority="high"
				only makes sense paired with eager loading, so the two always go
				together.
			--%>
			<div class="article-card__media">
				<img class="article-card__image"
					src="${constant.imgContext}${blog.path}" width="100%"
					height="250px" alt="${blog.topic}"
					<c:if test="${eager}">fetchpriority="high"</c:if>
					<c:if test="${!eager}">loading="lazy"</c:if>>
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
