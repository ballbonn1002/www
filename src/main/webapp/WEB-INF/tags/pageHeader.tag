<%@ tag pageEncoding="UTF-8"%>

<%@ attribute name="label" required="true" type="java.lang.String"%>

<%--
	Title + breadcrumb combo, shared across redesign pages (currently
	redesign/blog/blog.jsp and redesign/contacts/contacts.jsp) - each page
	drops this into a different background context (blog's light
	.articleblockbg vs contacts' dark parallax photo), so it deliberately
	sets no background of its own: .page-header has none in any page's own
	CSS, and .breadcrumb is already forced transparent site-wide
	(baseLayout.jsp: ".breadcrumb { background-color: transparent !important; }").
	Don't add a background here - it would stop blending into whichever
	section wraps it.

	Only a two-level "Home / X" breadcrumb, matching every current caller -
	not built out for deeper trails since nothing needs one yet.
--%>
<div class="page-header">
	<h1 class="page-title">${label}</h1>

	<ul class="breadcrumb">
		<li><a href="/">Home</a>&nbsp;/&nbsp;</li>
		<li><a class="currentPage" id="model">${label}</a></li>
	</ul>
</div>
