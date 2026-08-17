package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.TagAr;

@Repository
public class TagArDAOimpl implements TagArDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<TagAr> findArticleInTag() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<TagAr> tagAr = null;
		try {
			String sql = " SELECT tag.name,article.article_id FROM tag LEFT JOIN article_tag ON article_tag.tag_id = tag.tag_id LEFT JOIN article ON article.article_id = article_tag.article_id ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			tagAr = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tagAr;
	}

}
