package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Footer;

@Repository
public class FooterDAOImpl implements FooterDAO {

    @Autowired
    private SessionFactory sessionFactory;

	@Override
	public List<Footer> findParent() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Footer> footer = null;
        try {
        	String sql = "SELECT * FROM footer WHERE parent_footer_id = 0 AND status = 1";
            SQLQuery query = session.createSQLQuery(sql);
            query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
            footer = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return footer;
	}

	@Override
	public List<Map<String, Object>> findAllChildFooter() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> childFooter = null;
		try {
			String sql = "SELECT * FROM footer WHERE parent_footer_id != 0 AND status = 1";
            SQLQuery query = session.createSQLQuery(sql);
            query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
            childFooter = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return childFooter;
	}
}
