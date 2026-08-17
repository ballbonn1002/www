package com.cubesofttech.dao;

import com.cubesofttech.model.PageUri;

public interface PageUriDAO {
	public PageUri findById(String pageUriId) throws Exception;
}
