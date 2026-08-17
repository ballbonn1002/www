package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.ArticleRelated;

public interface ArticleRelatedDAO {

    public List<ArticleRelated> findByArticleId(String articleId) throws Exception;

}
