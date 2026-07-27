<%@ tag pageEncoding="UTF-8"%>

<%@ attribute name="label" required="true" type="java.lang.String"%>

<div class="page-header">
	<h1 class="page-title">${label}</h1>

	<ul class="breadcrumb">
		<li><a href="/">Home</a>&nbsp;/&nbsp;</li>
		<li><a class="currentPage" id="model">${label}</a></li>
	</ul>
</div>
