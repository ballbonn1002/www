package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.PageUri;

public interface PageUriDAO {
	void save(PageUri pageUri) throws Exception;
	
	void update(PageUri pageUri) throws Exception;
	
	void delete(PageUri pageUri) throws Exception;
	
	public PageUri findById(String pageUriId) throws Exception; 
	
	public List<PageUri> findAll() throws Exception;
}
