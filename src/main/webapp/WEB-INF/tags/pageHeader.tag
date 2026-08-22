<%@ tag pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="label" required="true" type="java.lang.String"%>
<%@ attribute name="breadcrumbLabel" required="false" type="java.lang.String"%>
<%@ attribute name="parentLabel" required="false" type="java.lang.String"%>
<%@ attribute name="parentHref" required="false" type="java.lang.String"%>

<style>
.page-title {
	margin: 0;
	font-size: 16px;
	font-weight: 600;
}

.page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	width: 100%;
	gap: 8px;
	padding: 24px 0;
}

.page-header > * {
	min-width: 0;
}

.page-header .breadcrumb {
	flex-wrap: nowrap;
	padding: 0;
	margin: 0;
}

.page-header .breadcrumb li {
	min-width: 0;
	overflow: hidden;
}

.page-header .currentPage {
	display: inline-block;
	max-width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	vertical-align: bottom;
}

@media screen and (max-width: 870px) {
	.page-header {
		flex-direction: column;
		align-items: flex-start;
		gap: 4px;
	}
	.page-header .breadcrumb {
		order: -1;
		font-size: 12px;
	}
	.page-title {
		font-size: 18px;
	}
}
</style>

<div class="page-header">
	<h1 class="page-title">${label}</h1>

	<ul class="breadcrumb">
		<li><a href="/">Home</a>&nbsp;/&nbsp;</li>
		<c:if test="${not empty parentLabel}">
			<li><a href="${parentHref}">${parentLabel}</a>&nbsp;/&nbsp;</li>
		</c:if>
		<li><a class="currentPage" id="model">${not empty breadcrumbLabel ? breadcrumbLabel : label}</a></li>
	</ul>
</div>
