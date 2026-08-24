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

	private static final int FOOTER_LINKS_PER_TYPE_LIMIT = 10;
	private static final int ARTICLE_TYPE_NEWS = 1;
	private static final int ARTICLE_TYPE_BLOG = 2;

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Map<String, Object>> findLatestArticlesByTypeWithPageUri() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> articleList = null;
		try {
			String sql = "(" + perTypeSelect("blogTypeId") + ") "
					+ "UNION ALL (" + perTypeSelect("newsTypeId") + ") "
					+ "ORDER BY article_id DESC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.setInteger("blogTypeId", ARTICLE_TYPE_BLOG);
			query.setInteger("newsTypeId", ARTICLE_TYPE_NEWS);
			articleList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleList;
	}

	private String perTypeSelect(String typeIdParamName) {
		return "SELECT a.article_id, a.page_id, a.article_type_id, a.topic, a.topic_en, p.page_uri_id, "
				+ "(case when p.page_uri_id LIKE '%blog%' then 'blog' "
				+ "when p.page_uri_id like '%news%' then 'news' END)  AS header_name "
				+ "FROM `article` a LEFT JOIN page_uri p ON a.article_id = p.model_id "
				+ "WHERE p.model = 'article' AND a.article_type_id = :" + typeIdParamName + " "
				+ "ORDER BY a.article_id DESC LIMIT " + FOOTER_LINKS_PER_TYPE_LIMIT;
	}

}
