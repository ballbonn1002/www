package com.cubesofttech.action;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public static final String NOT_FOUND = "notFound";
	// Divides evenly into the 3-per-row grid (col-lg-4).
	public static final int PAGE_SIZE = 12;
	// Featured "latest article" card, fetched separately from the grid.
	private static final int HERO_COUNT = 1;
	// "No limit" for the legacy (non-redesign) unpaginated pages.
	private static final int LEGACY_UNPAGINATED_LIMIT = 10000;
	// Sentinel for "..." in the pagination component's page-number list.
	public static final int PAGE_ELLIPSIS = -1;
	private static final Integer ARTICLE_TYPE_NEWS = 1;
	private static final Integer ARTICLE_TYPE_BLOG = 2;

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

	private int articleId;
	// 1-based; upper-bound clamp happens in initRedesignPagination().
	private int page = 1;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page < 1 ? 1 : page;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String init() {
		try {
			String requestURI = RewriteFilter.getRequestURI(request);
			log.debug(requestURI);
			request.setAttribute("requestURI", requestURI);

			boolean isNews = requestURI.contains("news");
			boolean redesign = isRedesignPreviewEnabled();

			if (redesign) {
				initRedesignPagination(isNews);
			} else {
				// Legacy pages render every article at once, no pagination UI.
				initLegacyUnpaginated(isNews);
			}

			request.setAttribute("constant", constant);

			return redesign ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	/** Redesign path: hero + paginated grid as separate queries. */
	private void initRedesignPagination(boolean isNews) throws Exception {
		List<Blog> heroFetch = isNews
				? blogDAO.findAllNewsWithPageUri(HERO_COUNT, 0)
				: blogDAO.findAllBlogsWithPageUri(HERO_COUNT, 0);
		if (heroFetch != null && !heroFetch.isEmpty()) {
			request.setAttribute("newBlog", heroFetch.get(0));
		}

		long totalArticles = isNews ? blogDAO.countAllNews() : blogDAO.countAllBlogs();
		long totalGridArticles = Math.max(totalArticles - HERO_COUNT, 0);
		int totalPages = (int) Math.max(1, Math.ceil(totalGridArticles / (double) PAGE_SIZE));

		// Out-of-range page falls back to the last valid one.
		if (page > totalPages) {
			page = totalPages;
		}

		request.setAttribute("blogList", fetchGridPage(isNews, page));
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("pageNumbers", buildPageNumbers(page, totalPages));

		// Clean path (no query string) for baseLayout.jsp's rel=next/prev.
		request.setAttribute("pageBaseUri", isNews ? "/news" : "/blog");

		// Distinct <title> per page beyond 1 (duplicate-content signal otherwise).
		if (page > 1) {
			request.setAttribute("title", " - หน้า " + page);
		}
	}

	/** Legacy path: one query, every article, no pagination. */
	private void initLegacyUnpaginated(boolean isNews) throws Exception {
		List<Blog> blogList = isNews
				? blogDAO.findAllNewsWithPageUri(LEGACY_UNPAGINATED_LIMIT, 0)
				: blogDAO.findAllBlogsWithPageUri(LEGACY_UNPAGINATED_LIMIT, 0);

		if (blogList != null && !blogList.isEmpty()) {
			request.setAttribute("newBlog", blogList.get(0));
		}
		request.setAttribute("blogList", blogList);
	}

	/** One page of grid articles, offset past the hero article. */
	private List<Blog> fetchGridPage(boolean isNews, int pageNum) throws Exception {
		int offset = HERO_COUNT + (pageNum - 1) * PAGE_SIZE;
		return isNews
				? blogDAO.findAllNewsWithPageUri(PAGE_SIZE, offset)
				: blogDAO.findAllBlogsWithPageUri(PAGE_SIZE, offset);
	}

	/** Page 1, current page's neighbors, and the last page; rest collapse to PAGE_ELLIPSIS. */
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

	private static final String VIEWED_ARTICLES_SESSION_KEY = "viewedArticleIds";

	/** Session-scoped view dedup - avoids double-counting baseLayout.jsp's tracking-param cleanup redirect. */
	@SuppressWarnings("unchecked")
	private boolean alreadyViewedThisSession(int articleId) {
		HttpSession session = request.getSession();
		Set<Integer> viewed = (Set<Integer>) session.getAttribute(VIEWED_ARTICLES_SESSION_KEY);
		if (viewed == null) {
			viewed = new HashSet<Integer>();
			session.setAttribute(VIEWED_ARTICLES_SESSION_KEY, viewed);
		}
		if (viewed.contains(articleId)) {
			return true;
		}
		viewed.add(articleId);
		return false;
	}

	/** Sec-Purpose/Purpose/X-Moz all mark a prefetch/prerender request, not a real visit. */
	private boolean isSpeculativeRequest() {
		String secPurpose = request.getHeader("Sec-Purpose");
		if (secPurpose != null && secPurpose.toLowerCase().contains("prefetch")) {
			return true;
		}
		String purpose = request.getHeader("Purpose");
		if (purpose != null && purpose.equalsIgnoreCase("prefetch")) {
			return true;
		}
		String xMoz = request.getHeader("X-Moz");
		return xMoz != null && xMoz.equalsIgnoreCase("prefetch");
	}

	// Only catches bots that self-identify via User-Agent, not spoofed ones.
	private static final String[] KNOWN_BOT_USER_AGENT_MARKERS = { "bot", "spider", "crawl", "slurp",
			"facebookexternalhit", "whatsapp", "telegrambot", "slackbot", "discordbot", "linkedinbot", "pinterest",
			"embedly", "outbrain", "vkshare", "w3c_validator" };

	private boolean isKnownBotUserAgent() {
		String userAgent = request.getHeader("User-Agent");
		if (userAgent == null || userAgent.isEmpty()) {
			// Corporate proxies strip this header from real visitors too.
			return false;
		}
		String lower = userAgent.toLowerCase();
		for (String marker : KNOWN_BOT_USER_AGENT_MARKERS) {
			if (lower.contains(marker)) {
				return true;
			}
		}
		return false;
	}

	// Loose per (IP, User-Agent, article) quota, not precise dedup.
	private static final int VIEW_QUOTA_LIMIT = 30;
	private static final long VIEW_QUOTA_WINDOW_MS = 60L * 60 * 1000; // 1 hour
	private static final ConcurrentHashMap<String, ViewQuotaBucket> VIEW_QUOTA_BUCKETS = new ConcurrentHashMap<String, ViewQuotaBucket>();

	private static final class ViewQuotaBucket {
		long windowStart;
		int count;
	}

	private String clientIp() {
		// First hop of X-Forwarded-For, for when this sits behind a proxy.
		String forwarded = request.getHeader("X-Forwarded-For");
		if (forwarded != null && !forwarded.isEmpty()) {
			return forwarded.split(",")[0].trim();
		}
		return request.getRemoteAddr();
	}

	private boolean exceedsIpQuota(int articleId) {
		// Occasional sweep keeps the bucket map bounded.
		if (Math.random() < 0.002) {
			long cutoff = System.currentTimeMillis() - VIEW_QUOTA_WINDOW_MS;
			Iterator<Map.Entry<String, ViewQuotaBucket>> it = VIEW_QUOTA_BUCKETS.entrySet().iterator();
			while (it.hasNext()) {
				ViewQuotaBucket bucket = it.next().getValue();
				synchronized (bucket) {
					if (bucket.windowStart < cutoff) {
						it.remove();
					}
				}
			}
		}

		String userAgent = request.getHeader("User-Agent");
		String key = clientIp() + "|" + (userAgent == null ? "" : userAgent) + "|" + articleId;
		long now = System.currentTimeMillis();
		ViewQuotaBucket created = new ViewQuotaBucket();
		created.windowStart = now;
		ViewQuotaBucket bucket = VIEW_QUOTA_BUCKETS.putIfAbsent(key, created);
		if (bucket == null) {
			bucket = created;
		}
		synchronized (bucket) {
			if (now - bucket.windowStart > VIEW_QUOTA_WINDOW_MS) {
				bucket.windowStart = now;
				bucket.count = 0;
			}
			bucket.count++;
			return bucket.count > VIEW_QUOTA_LIMIT;
		}
	}

	private boolean isRedesignPreviewEnabled() {
		return constant.isRedesignEnabled();
	}

	public String blogDetail() {
		try {
			log.debug(getArticleId());

			String requestURI = (String) request.getAttribute("rewrittenRequestURI");
			if (requestURI == null) {
				requestURI = request.getRequestURI(); // Fallback if not set
			}
			log.debug("Request URI: " + requestURI);

			boolean redesign = isRedesignPreviewEnabled();

			request.setAttribute("maxLatestBlog", MAXLATESTBLOG);
			request.setAttribute("bloguri", requestURI);

			// Runs before the fetch so the increment shows up in this same response.
			if (!isSpeculativeRequest() && !isKnownBotUserAgent() && !alreadyViewedThisSession(getArticleId())
					&& !exceedsIpQuota(getArticleId())) {
				blogDAO.incrementViewCount(getArticleId());
			}

			Blog blog = blogDAO.findByArticleId(getArticleId());
			if (blog == null) {
				log.error("No article found for articleId=" + getArticleId());
				return NOT_FOUND;
			}
			log.debug(blog.getTimePost());
			request.setAttribute("blog", blog);
			request.setAttribute("authorName", blogDAO.findAuthorNameByUserId(blog.getUserId()));
			log.debug("blog.detail: " + blog.getDetail());
			// Only the redesign JSP renders ${cleanDetail} - legacy renders ${blog.detail} raw.
			if (redesign) {
				String cleanDetail = ArticleHtmlSanitizer.clean(blog.getDetail());
				request.setAttribute("cleanDetail", cleanDetail);
				log.debug("cleanDetail: " + cleanDetail);
			}
			log.debug(blog);
			request.setAttribute("tags", tagArDAO.findArticleInTag(getArticleId()));
			if (!"".equals(blog.getFileId()) && blog.getFileId() != null) {
				FileUpload file = fileUploadDAO.findById(Integer.parseInt(blog.getFileId()));
				log.debug(blog.getFileId());
				request.setAttribute("name", file.getName());
				request.setAttribute("path", file.getPath());
				request.setAttribute("alt_name", file.getAltName());

				request.setAttribute("ogImageWidth", OG_IMAGE_WIDTH);
				request.setAttribute("ogImageHeight", OG_IMAGE_HEIGHT);
			}

			if (blog.getArticleTypeId().equals(ARTICLE_TYPE_NEWS)) {
				request.setAttribute("pageURI", "/news");
			} else if (blog.getArticleTypeId().equals(ARTICLE_TYPE_BLOG)) {
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
			if (blog.getTimePost() != null) {
				ZonedDateTime zonedDateTime = blog.getTimePost().toInstant().atZone(ZoneId.of("Asia/Bangkok")); // Or +07:00
				request.setAttribute("datePublished", zonedDateTime.format(formatter));
			}

			if (blog.getTimeUpdate() != null) {
				ZonedDateTime zonedDateTime2 = blog.getTimeUpdate().toInstant().atZone(ZoneId.of("Asia/Bangkok")); // Or +07:00
				request.setAttribute("dateModified", zonedDateTime2.format(formatter));
			}

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

			return redesign ? REDESIGN : SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	private static final int OG_IMAGE_WIDTH = 1200;
	private static final int OG_IMAGE_HEIGHT = 630;

}
