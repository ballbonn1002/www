package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

public interface ArticleDAO {

	public List<Map<String, Object>> findAllPageUriArticle() throws Exception;

}
