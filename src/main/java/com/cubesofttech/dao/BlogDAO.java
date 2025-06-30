package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Blog;

public interface BlogDAO {
	
	public Blog findByArticleId(Integer articleId) throws Exception;
	
	public List<Blog> findAllWithPageUri() throws Exception;
	
	public List<Blog> findAllBlogsWithPageUri() throws Exception;
	
	public List<Blog> findAllNewsWithPageUri() throws Exception;
}
