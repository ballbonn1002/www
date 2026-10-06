<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.cubesofttech.util.ArticleHtmlSanitizer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="comp"%>

<h2 class="article-list-heading" id="articledetail">All ${pageLabel == 'News' ? 'News' : 'Articles'}</h2>

<div class="row article-list-row">
	<c:forEach var="blog" items="${blogList}" varStatus="Count">
		<%
		Object blogRaw = pageContext.getAttribute("blog");
		String blogDetailRaw = "";
		if (blogRaw instanceof Map) {
			Object d = ((Map) blogRaw).get("detail");
			blogDetailRaw = d != null ? d.toString() : "";
		}
		pageContext.setAttribute("blogPreviewText", ArticleHtmlSanitizer.toPreviewText(blogDetailRaw, 120));
		%>

		<div class="col-12 col-sm-6 col-lg-4">
			<comp:blogCard blog="${blog}" constant="${constant}"
				excerpt="${blogPreviewText}" eager="${Count.count <= 3}" />
		</div>
	</c:forEach>
</div>

<c:if test="${totalPages > 1}">
	<nav aria-label="Blog pagination">
		<ul class="pagination blog-pagination justify-content-center">

			<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				<a class="page-link" href="?page=${currentPage - 1}#articledetail"
					aria-label="Previous" tabindex="${currentPage == 1 ? '-1' : '0'}">
					<i class="bi bi-chevron-left page-link__icon" aria-hidden="true"></i>
					<span class="page-link__text">Previous</span>
				</a>
			</li>

			<c:forEach var="pageNum" items="${pageNumbers}">
				<c:choose>
					<c:when test="${pageNum == -1}">
						<li class="page-item disabled"><span class="page-link">&hellip;</span></li>
					</c:when>
					<c:otherwise>
						<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
							<a class="page-link" href="?page=${pageNum}#articledetail">${pageNum}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				<a class="page-link" href="?page=${currentPage + 1}#articledetail"
					aria-label="Next" tabindex="${currentPage == totalPages ? '-1' : '0'}">
					<span class="page-link__text">Next</span>
					<i class="bi bi-chevron-right page-link__icon" aria-hidden="true"></i>
				</a>
			</li>
		</ul>
	</nav>
</c:if>
