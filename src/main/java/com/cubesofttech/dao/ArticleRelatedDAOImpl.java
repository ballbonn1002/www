package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Article;
import com.cubesofttech.model.ArticleRelated;

@Repository
public class ArticleRelatedDAOImpl implements ArticleRelatedDAO {
	
	@Autowired
    private SessionFactory sessionFactory;


	@Override
	public List<ArticleRelated> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        List<ArticleRelated> articleRelated = null;
        try {
        	articleRelated = session.createCriteria(ArticleRelated.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return articleRelated;
	}

	@Override
	public List<ArticleRelated> findByArticleId(String articleId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<ArticleRelated> articleRelated = null;
		try {
			String sql = "SELECT ar.article_id, ar.related_article_id, a.topic, a.detail, a.time_post, u.name, f.path, p.page_uri_id "
					+ "FROM article_related ar "
					+ "INNER JOIN article a ON ar.related_article_id = a.article_id "
					+ "LEFT JOIN user u ON a.user_id = u.id "
					+ "LEFT JOIN file f ON f.file_id = a.file_id "
					+ "LEFT JOIN page_uri p ON p.model_id = ar.related_article_id "
					+ "WHERE ar.article_id = :articleId "
					+ "ORDER BY ar.related_article_id DESC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("articleId", articleId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			// Capped at 3 cards - the related-articles section on blog_detail.jsp
			// shows a fixed-width row of cards, not an unbounded list, so this
			// caps it at the source instead of over-fetching and cutting in the JSP.
			query.setMaxResults(3);
			articleRelated = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleRelated;
	}
	


}
