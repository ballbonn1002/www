package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.TagAr;

public interface TagArDAO {

	List<TagAr> findArticleInTag() throws Exception;
}
