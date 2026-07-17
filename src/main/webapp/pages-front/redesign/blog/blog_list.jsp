<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.cubesofttech.util.ArticleHtmlSanitizer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="comp"%>

<%--
	Blog List zone - the paginated card grid below the hero. Kept as its own
	include, separate from the hero markup in blog.jsp, so this is the one
	piece that ever needs to be re-rendered for pagination (AJAX, in a later
	step) without touching the hero at all. blogList/currentPage/totalPages/
	pageNumbers are all set by BlogAction.init() - no scriptlet reaching into
	request attributes here beyond what each card needs for its own preview
	text, same as before.

	No begin="1" on the c:forEach - unlike the old single-query version,
	BlogAction now fetches the hero and this grid as two separate queries
	(grid offset past the hero article), so blogList here never contains the
	hero's article to begin with.
--%>
<div class="row article-list-row" id="articledetail">
	<c:forEach var="blog" items="${blogList}" varStatus="Count">
		<%
		// Same Map-vs-Blog situation as newBlog in blog.jsp: each "blog" here
		// is a java.util.Map for this iteration (set by c:forEach as a
		// page-scoped attribute), not a Blog entity - see BlogDAOImpl's
		// AliasToEntityMapResultTransformer.
		Object blogRaw = pageContext.getAttribute("blog");
		String blogDetailRaw = "";
		if (blogRaw instanceof Map) {
			Object d = ((Map) blogRaw).get("detail");
			blogDetailRaw = d != null ? d.toString() : "";
		}
		pageContext.setAttribute("blogPreviewText", ArticleHtmlSanitizer.toPreviewText(blogDetailRaw, 120));
		%>
		<%--
			reveal-card lives on this column wrapper rather than blogCard.tag
			itself - .articleblockbg2 inside the card already has its own
			:hover transform (lift on hover), and animating transform on that
			same element for scroll-reveal would fight it once a card becomes
			visible. Keeping the two on separate elements avoids that, and
			also keeps blogCard.tag (shared with blog_detail.jsp's sidebar,
			which isn't part of this scroll-reveal feature) untouched here.
		--%>
		<div class="col-12 col-sm-6 col-lg-4 reveal-card">
			<comp:blogCard blog="${blog}" constant="${constant}"
				excerpt="${blogPreviewText}" />
		</div>
	</c:forEach>
</div>

<%--
	Bootstrap 4 pagination (.pagination/.page-item/.page-link) - every link
	is a real <a href="?page=N">, not a <button onclick>, so this works with
	JS off and is a normal crawlable link for search engines. BlogAction
	already clamped currentPage into [1, totalPages], so no bounds-checking
	needed here beyond what disables Previous/Next at the ends.
--%>
<c:if test="${totalPages > 1}">
	<nav aria-label="Blog pagination">
		<ul class="pagination blog-pagination justify-content-center">
			<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				<a class="page-link" href="?page=${currentPage - 1}"
					aria-label="Previous" tabindex="${currentPage == 1 ? '-1' : '0'}">Previous</a>
			</li>

			<c:forEach var="pageNum" items="${pageNumbers}">
				<c:choose>
					<c:when test="${pageNum == -1}">
						<li class="page-item disabled"><span class="page-link">&hellip;</span></li>
					</c:when>
					<c:otherwise>
						<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
							<a class="page-link" href="?page=${pageNum}">${pageNum}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				<a class="page-link" href="?page=${currentPage + 1}"
					aria-label="Next" tabindex="${currentPage == totalPages ? '-1' : '0'}">Next</a>
			</li>
		</ul>
	</nav>
</c:if>
