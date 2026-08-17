package com.cubesofttech.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.PageUri;

@Repository
public class PageUriDAOImpl implements PageUriDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public PageUri findById(String pageUriId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		PageUri pageUri = null;
		try {
			pageUri = (PageUri) session.get(PageUri.class, pageUriId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageUri;
	}

}
