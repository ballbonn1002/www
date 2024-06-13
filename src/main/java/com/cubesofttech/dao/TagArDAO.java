package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.TagAr;

public interface TagArDAO {

	public List<TagAr> findAll() throws Exception;

	public TagAr findBytagId(int tagArId) throws Exception;

	List<Integer> findByTagArId(String tagArId) throws Exception;

	List<TagAr> findArticleInTag() throws Exception;
}
