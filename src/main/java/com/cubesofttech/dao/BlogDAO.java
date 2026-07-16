package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Blog;

public interface BlogDAO {
	
	public Blog findByArticleId(Integer articleId) throws Exception;
	
	public List<Blog> findAllWithPageUri() throws Exception;
	
	public List<Blog> findAllBlogsWithPageUri(int limit, int offset) throws Exception;

	public List<Blog> findAllNewsWithPageUri(int limit, int offset) throws Exception;

	public long countAllBlogs() throws Exception;

	public long countAllNews() throws Exception;
}
