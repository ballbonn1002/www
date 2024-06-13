package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Article;
import com.cubesofttech.model.ArticleRelated;

public interface ArticleRelatedDAO {
	
	
    public List<ArticleRelated> findAll() throws Exception;
    
    public List<ArticleRelated> findByArticleId(String articleId) throws Exception;
    
    
}
