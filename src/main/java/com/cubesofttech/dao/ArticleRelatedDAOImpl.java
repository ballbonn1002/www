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
			// No cap - this query backs both blog_detail.jsp's legacy and
			// redesign pages (same BlogAction.blogDetail() call), so limiting
			// it here for the redesign's card row was also silently capping
			// legacy's related-articles list to 3 items. Redesign now shows
			// this as a scrollable row instead, so it doesn't need a fixed
			// count either - display-side concerns belong in the JSP, not
			// the query.
			articleRelated = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleRelated;
	}
	


}
