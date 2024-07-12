package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.PageUri;

@Repository
public class PageUriDAOImpl implements PageUriDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(PageUri pageUri) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(pageUri);
		session.flush();
	}

	@Override
	public void update(PageUri pageUri) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(pageUri);
		session.flush();
	}

	@Override
	public void delete(PageUri pageUri) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(pageUri);
		session.flush();
	}

	@Override
	public PageUri findById(String pageUriId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		PageUri pageUri = null;
		try {
			pageUri = (PageUri) session.get(PageUri.class, pageUriId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return pageUri;
	}

	@Override
	public List<PageUri> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<PageUri> pageUriList = null;
		try {
			String sql = "SELECT * FROM page_uri ORDER BY page_uri_id ASC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			pageUriList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageUriList;
	}

}
