package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDAOimpl implements ArticleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Map<String, Object>> findAllPageUriArticle() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> articleList = null;
		try {
			String sql = "SELECT a.article_id, a.page_id, a.article_type_id, a.topic, a.topic_en, p.page_uri_id, "
					+ "(case when p.page_uri_id LIKE '%blog%' then 'blog' "
					+ "when p.page_uri_id like '%news%' then 'news' END)  AS header_name "
					+ "FROM `article` a LEFT JOIN page_uri p ON a.article_id = p.model_id "
					+ "WHERE p.model = 'article' ORDER BY `article_id` DESC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			articleList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleList;
	}

}
