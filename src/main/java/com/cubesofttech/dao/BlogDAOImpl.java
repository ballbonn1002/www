package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Blog;

@Repository
public class BlogDAOImpl implements BlogDAO {

	/**
	 * findAllBlogsWithPageUri/findAllNewsWithPageUri
	 */
	private static final int DETAIL_PREVIEW_RAW_LENGTH = 8000;

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Blog findByArticleId(Integer articleId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Blog article = null;
		try {
			article = (Blog) session.get(Blog.class, articleId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return article;
	}

	@Override
	public List<Blog> findAllWithPageUri() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Blog> articleList = null;
		Timestamp nowTs = new Timestamp(System.currentTimeMillis());
		try {
			String sql = "SELECT a.article_id, a.article_type_id, a.topic, a.user_id, a.detail, a.file_id, a.status, a.user_create, a.user_update, "
					+ "a.time_create, a.time_update, a.view_count, u.name, f.path, p.page_uri_id "
					+ "FROM article a LEFT JOIN user u ON a.user_id = u.id "
					+ "LEFT JOIN file f ON a.file_id = f.file_id "
					+ "LEFT JOIN page_uri p ON a.article_id = p.model_id "
					+ "WHERE (p.page_uri_id LIKE '%blog%' OR p.page_uri_id LIKE '%news%') "
					+ "AND a.status = 1 AND a.time_post <= :nowParam ORDER BY a.time_post DESC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.setTimestamp("nowParam", nowTs);
			articleList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleList;
	}

	@Override
	public List<Blog> findAllBlogsWithPageUri(int limit, int offset) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Blog> articleList = null;
		Timestamp nowTs = new Timestamp(System.currentTimeMillis());
		try {
			String sql = "SELECT a.article_id, a.article_type_id, a.topic, a.user_id, LEFT(a.detail, :detailLength) AS detail, a.file_id, a.time_post, a.user_create, a.user_update, "
				+ "a.time_create, a.time_update, a.view_count, u.name, f.path, p.page_uri_id, a.status "
				+ "FROM article a LEFT JOIN user u ON a.user_id = u.id "
				+ "LEFT JOIN file f ON a.file_id = f.file_id "
				+ "LEFT JOIN page_uri p ON a.article_id = p.model_id "
				+ "WHERE p.page_uri_id LIKE '%blog%' AND a.status = 1 AND a.time_post <= :nowParam ORDER BY a.time_post DESC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.setTimestamp("nowParam", nowTs);
			query.setInteger("detailLength", DETAIL_PREVIEW_RAW_LENGTH);
			query.setFirstResult(offset);
			query.setMaxResults(limit);
			articleList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return articleList;
	}

	@Override
	public List<Blog> findAllNewsWithPageUri(int limit, int offset) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Blog> articleList = null;
		Timestamp nowTs = new Timestamp(System.currentTimeMillis());
		try {
			String sql = "SELECT a.article_id, a.article_type_id, a.topic, a.user_id, LEFT(a.detail, :detailLength) AS detail, a.file_id, a.time_post, a.user_create, a.user_update, "
				+ "a.time_create, a.time_update, a.view_count, u.name, f.path, p.page_uri_id, a.status "
				+ "FROM article a LEFT JOIN user u ON a.user_id = u.id "
				+ "LEFT JOIN file f ON a.file_id = f.file_id "
				+ "LEFT JOIN page_uri p ON a.article_id = p.model_id "
				+ "WHERE p.page_uri_id LIKE '%news%' AND a.status = 1 AND a.time_post <= :nowParam ORDER BY a.time_post DESC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.setTimestamp("nowParam", nowTs);
			query.setInteger("detailLength", DETAIL_PREVIEW_RAW_LENGTH);
			query.setFirstResult(offset);
			query.setMaxResults(limit);
			articleList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleList;
	}

	@Override
	public long countAllBlogs() throws Exception {
		return countByPageUriLike("%blog%");
	}

	@Override
	public long countAllNews() throws Exception {
		return countByPageUriLike("%news%");
	}

	/**
	 * Total row count behind findAllBlogsWithPageUri/findAllNewsWithPageUri's
	 */
	private long countByPageUriLike(String pageUriPattern) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Timestamp nowTs = new Timestamp(System.currentTimeMillis());
		Number count = 0;
		try {
			String sql = "SELECT COUNT(*) "
				+ "FROM article a LEFT JOIN page_uri p ON a.article_id = p.model_id "
				+ "WHERE p.page_uri_id LIKE :pageUriPattern AND a.status = 1 AND a.time_post <= :nowParam";
			SQLQuery query = session.createSQLQuery(sql);
			query.setString("pageUriPattern", pageUriPattern);
			query.setTimestamp("nowParam", nowTs);
			count = (Number) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count == null ? 0 : count.longValue();
	}

	// Raw atomic UPDATE, not through the Hibernate entity - avoids
	// flushing every other field just to bump a counter.
	@Override
	public void incrementViewCount(int articleId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			String sql = "UPDATE article SET view_count = view_count + 1 WHERE article_id = :articleId";
			SQLQuery query = session.createSQLQuery(sql);
			query.setInteger("articleId", articleId);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
