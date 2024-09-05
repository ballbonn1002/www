package com.cubesofttech.action;

import java.io.File;
import java.util.List;

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

	File articleImageFile;

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
		List<Blog> blogList = null;
		try {			
			String requestURI = RewriteFilter.getRequestURI(request);
			log.debug(requestURI);
			request.setAttribute("requestURI", requestURI);
			
			if(requestURI.contains("news")) {
				blogList = blogDAO.findAllNewsWithPageUri();
			}else {
				blogList = blogDAO.findAllBlogsWithPageUri();
			}
			request.setAttribute("blogList", blogList);
			
			if(blogList != null && !blogList.isEmpty()) {
				request.setAttribute("newBlog", blogList.get(0));
			}
			
			request.setAttribute("constant", constant);
			
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
	public String blogDetail() {
		try {
			log.debug(getArticleId());
			
			request.setAttribute("maxLatestBlog", MAXLATESTBLOG);
			
			Blog blog = blogDAO.findByArticleId(getArticleId());
			
			request.setAttribute("blog", blog);
			log.debug(blog);
			request.setAttribute("tags", tagArDAO.findArticleInTag());
			
			if(blog != null && !"".equals(blog.getFileId())) {
				FileUpload file = fileUploadDAO.findById(Integer.parseInt(blog.getFileId()));
				log.debug(blog.getFileId());
				request.setAttribute("path", file.getPath());
			}
			
			if(blog.getArticleTypeId().equals(1)) {
				request.setAttribute("requestURI", "/news");
			}else if(blog.getArticleTypeId().equals(2)) {
				request.setAttribute("requestURI", "/blog");
			}
			
			List<ArticleRelated> relatedBlogs = articleRelatedDAO.findByArticleId(Integer.toString(getArticleId()));
			//log.debug(relatedBlogs);
			request.setAttribute("relatedBlogs", relatedBlogs);
			
			List<Blog> blogList = blogDAO.findAllWithPageUri();
//			request.setAttribute("relatedBlogs", blogList);
			request.setAttribute("latestBlogs", blogList);
			log.debug(constant);
			request.setAttribute("constant", constant);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
