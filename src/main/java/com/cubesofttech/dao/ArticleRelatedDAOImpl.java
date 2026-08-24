package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.ArticleRelated;

@Repository
public class ArticleRelatedDAOImpl implements ArticleRelatedDAO {

	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public List<ArticleRelated> findByArticleId(String articleId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<ArticleRelated> articleRelated = null;
		try {
			String sql = "SELECT ar.article_id, ar.related_article_id, a.topic, a.detail, a.time_post, a.view_count, u.name, f.path, p.page_uri_id "
					+ "FROM article_related ar "
					+ "INNER JOIN article a ON ar.related_article_id = a.article_id "
					+ "LEFT JOIN user u ON a.user_id = u.id "
					+ "LEFT JOIN file f ON f.file_id = a.file_id "
					+ "LEFT JOIN page_uri p ON p.model_id = ar.related_article_id "
					+ "WHERE ar.article_id = :articleId "
					+ "AND p.model = 'article' "
					+ "ORDER BY ar.related_article_id DESC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("articleId", articleId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			// No cap - shared by legacy and redesign, display-side limits belong in the JSP.
			articleRelated = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleRelated;
	}

}
