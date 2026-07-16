package com.cubesofttech.action;

import java.io.File;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.ArticleRelatedDAO;
import com.cubesofttech.dao.BlogDAO;
import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.PageUriDAO;
import com.cubesofttech.dao.TagArDAO;
import com.cubesofttech.model.ArticleRelated;
import com.cubesofttech.model.Blog;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.PageUri;
import com.cubesofttech.system.Constant;
import com.cubesofttech.util.ArticleHtmlSanitizer;
import com.cubesofttech.util.RewriteFilter;
import com.opensymphony.xwork2.ActionSupport;

public class BlogAction extends ActionSupport {

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String ONLINEUSER = "onlineUser";
	public static final String USERSEQ = "userseq";
	public static final String USERID = "userId";
	public static final String ARTICLEID = "articleId";
	public static final Integer MAXLATESTBLOG = 10;
	public static final String REDESIGN = "redesign";
	// 12 divides evenly into the 3-per-row grid (col-lg-4) blog.jsp renders,
	// so a page never ends on a half-empty row.
	public static final int PAGE_SIZE = 12;
	// The featured "latest article" card is always the single newest
	// article, fetched separately from (and never duplicated into) the
	// paginated grid below it - the grid's dataset starts right after it.
	private static final int HERO_COUNT = 1;
	// Sentinel in the page-number list blog.jsp's pagination component reads
	// to know where to render "..." instead of a page link.
	public static final int PAGE_ELLIPSIS = -1;
	private String metaDescription = "Cube SoftTech is an innovative, high-quality software development company. We are a professional company, focused on IT consulting, web application development &amp; integration. Our services cover every aspect of web / mobile development, from start to finish. From one off projects to a fully outsourced development team., Java Outsourcing, IT Staff Outsourcing, IT Outsource, Staff Outsourcing, IT Staffing solutions, Outsource IT Staff, เอ้าซอร์สซิ่ง, ไอที เอ้าซอร์สซิ่ง";

	@Autowired
	private Constant constant;

	@Autowired
	private BlogDAO blogDAO;

	@Autowired
	private FileUploadDAO fileUploadDAO;

	@Autowired
	private TagArDAO tagArDAO;

	@Autowired
	private ArticleRelatedDAO articleRelatedDAO;

	@Autowired
	private PageUriDAO pageUriDAO;

	private Blog blog;
	private int articleId;
	private File fileUpload;
	private String fileUploadSize;
	private String fileUploadFileName;
	private String detail;
	private String topic;
	private String type;
	private String tags;
	private String path;
	private int fileId;
	private String author;
	private String fileName;
	private String fileType;
	private String srcDelete;
	// Bound from the "page" request param (blog.jsp?page=2) - 1-based,
	// defaults to page 1 when absent. Only clamped against <1 here; the
	// upper bound (page beyond how many actually exist) isn't known until
	// init() has queried the count, so that clamp happens there instead.
	private int page = 1;

	File articleImageFile;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page < 1 ? 1 : page;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadSize() {
		return fileUploadSize;
	}

	public void setFileUploadSize(String fileUploadSize) {
		this.fileUploadSize = fileUploadSize;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public File getArticleImageFile() {
		return articleImageFile;
	}

	public void setArticleImageFile(File articleImageFile) {
		this.articleImageFile = articleImageFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getSrcDelete() {
		return srcDelete;
	}

	public void setSrcDelete(String srcDelete) {
		this.srcDelete = srcDelete;
	}

	public String init() {
		try {
			String requestURI = RewriteFilter.getRequestURI(request);
			log.debug(requestURI);
			request.setAttribute("requestURI", requestURI);

			boolean isNews = requestURI.contains("news");

			// Hero card: always the single newest article, independent of
			// whatever grid page is showing - fetched on its own instead of
			// reusing the grid query's first row, since the grid below
			// deliberately never includes this article (see the offset in
			// fetchGridPage()).
			List<Blog> heroFetch = isNews
					? blogDAO.findAllNewsWithPageUri(HERO_COUNT, 0)
					: blogDAO.findAllBlogsWithPageUri(HERO_COUNT, 0);
			if (heroFetch != null && !heroFetch.isEmpty()) {
				request.setAttribute("newBlog", heroFetch.get(0));
			}

			long totalArticles = isNews ? blogDAO.countAllNews() : blogDAO.countAllBlogs();
			long totalGridArticles = Math.max(totalArticles - HERO_COUNT, 0);
			int totalPages = (int) Math.max(1, Math.ceil(totalGridArticles / (double) PAGE_SIZE));

			// A page beyond what actually exists (or a value setPage()
			// already couldn't make sense of) quietly falls back to the
			// last valid page instead of rendering an empty grid or letting
			// a bad request param surface as an error to the visitor.
			if (page > totalPages) {
				page = totalPages;
			}

			request.setAttribute("blogList", fetchGridPage(isNews, page));
			request.setAttribute("currentPage", page);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("pageNumbers", buildPageNumbers(page, totalPages));
			request.setAttribute("constant", constant);

			// Clean path (no query string) for baseLayout.jsp to build
			// rel="next"/rel="prev" links from - requestURI above already
			// has ?page=N mixed in for the *current* request, which isn't
			// reusable for constructing a link to a *different* page.
			request.setAttribute("pageBaseUri", isNews ? "/news" : "/blog");

			// RewriteFilter sets "title" to "" for every request that isn't
			// a PageUri-forwarded CMS page (blog/news included) - safe to
			// overwrite here. Page 1 keeps the plain tiles title ("Blog"/
			// "News") unchanged; later pages get a suffix so their <title>
			// isn't byte-identical to page 1's (duplicate-content signal).
			if (page > 1) {
				request.setAttribute("title", " - หน้า " + page);
			}

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	/**
	 * Fetches exactly one page's worth of grid articles, offset past the
	 * hero article so the two never overlap regardless of which page is
	 * requested.
	 */
	private List<Blog> fetchGridPage(boolean isNews, int pageNum) throws Exception {
		int offset = HERO_COUNT + (pageNum - 1) * PAGE_SIZE;
		return isNews
				? blogDAO.findAllNewsWithPageUri(PAGE_SIZE, offset)
				: blogDAO.findAllBlogsWithPageUri(PAGE_SIZE, offset);
	}

	/**
	 * Page numbers for the Bootstrap pagination component, with PAGE_ELLIPSIS
	 * standing in for a "..." gap - always shows page 1, the current page's
	 * immediate neighbors, and the last page, collapsing everything between
	 * into a single ellipsis rather than listing every page when there are
	 * many.
	 */
	private List<Integer> buildPageNumbers(int currentPage, int totalPages) {
		List<Integer> pages = new ArrayList<Integer>();
		if (totalPages <= 1) {
			pages.add(1);
			return pages;
		}

		int windowStart = Math.max(2, currentPage - 1);
		int windowEnd = Math.min(totalPages - 1, currentPage + 1);

		pages.add(1);
		if (windowStart > 2) {
			pages.add(PAGE_ELLIPSIS);
		}
		for (int p = windowStart; p <= windowEnd; p++) {
			pages.add(p);
		}
		if (windowEnd < totalPages - 1) {
			pages.add(PAGE_ELLIPSIS);
		}
		pages.add(totalPages);
		return pages;
	}

	/**
	 * Internal-only preview toggle: set via /redesign-preview-on (see
	 * RedesignPreviewAction), never exposed as a URL parameter that a regular
	 * visitor could set themselves.
	 */
	private boolean isRedesignPreviewEnabled() {
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			return false;
		}
		for (Cookie cookie : cookies) {
			if (RedesignPreviewAction.COOKIE_NAME.equals(cookie.getName()) && "1".equals(cookie.getValue())) {
				return true;
			}
		}
		return false;
	}

	public String blogDetail() {
		try {
			log.debug(getArticleId());

			String requestURI = (String) request.getAttribute("rewrittenRequestURI");
			if (requestURI == null) {
				requestURI = request.getRequestURI(); // Fallback if not set
			}
			log.debug("Request URI: " + requestURI);

			// Set attributes for JSP
			request.setAttribute("maxLatestBlog", MAXLATESTBLOG);
			request.setAttribute("bloguri", requestURI);

			Blog blog = blogDAO.findByArticleId(getArticleId());
			log.debug(blog.getTimePost());
			request.setAttribute("blog", blog);
			log.debug("blog.detail: " + blog.getDetail());
			String cleanDetail = ArticleHtmlSanitizer.clean(blog.getDetail());
			request.setAttribute("cleanDetail", cleanDetail);
			log.debug("cleanDetail: " + cleanDetail);
			log.debug(blog);
			request.setAttribute("tags", tagArDAO.findArticleInTag());
			if (blog != null && (!"".equals(blog.getFileId()) && blog.getFileId() != null)) {
				FileUpload file = fileUploadDAO.findById(Integer.parseInt(blog.getFileId()));
				log.debug(blog.getFileId());
				request.setAttribute("name", file.getName());
				request.setAttribute("path", file.getPath());
				request.setAttribute("alt_name", file.getAltName());
			}

			if (blog.getArticleTypeId().equals(1)) {
				request.setAttribute("pageURI", "/news");
			} else if (blog.getArticleTypeId().equals(2)) {
				request.setAttribute("pageURI", "/blog");
			}

			List<ArticleRelated> relatedBlogs = articleRelatedDAO.findByArticleId(Integer.toString(getArticleId()));
			request.setAttribute("relatedBlogs", relatedBlogs);

			List<Blog> blogList = blogDAO.findAllWithPageUri();
			request.setAttribute("latestBlogs", blogList);
			log.debug(constant);
			request.setAttribute("constant", constant);
			request.setAttribute("requestURI", requestURI);

			DateTimeFormatter formatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;
			if (blog.getTimePost() == null)
				return null;
			ZonedDateTime zonedDateTime = blog.getTimePost().toInstant().atZone(ZoneId.of("Asia/Bangkok")); // Or +08:00
			request.setAttribute("datePublished", zonedDateTime.format(formatter));

			if (blog.getTimeUpdate() == null)
				return null;
			ZonedDateTime zonedDateTime2 = blog.getTimeUpdate().toInstant().atZone(ZoneId.of("Asia/Bangkok")); // Or
																												// +08:00
			request.setAttribute("dateModified", zonedDateTime2.format(formatter));

			PageUri pageUri = null;
			try {
				pageUri = pageUriDAO.findById(requestURI);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (pageUri != null) {
				log.debug("Page URI found");
				request.setAttribute("title", pageUri.getTitle());
				request.setAttribute("metaDescription", pageUri.getMeta());
			}

			return isRedesignPreviewEnabled() ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
