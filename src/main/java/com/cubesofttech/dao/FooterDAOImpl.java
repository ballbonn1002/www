package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Footer;

@Repository
public class FooterDAOImpl implements FooterDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Footer footer) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(footer);
        session.flush();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> findAll() throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        List<Map<String, Object>> footerList = null;
        try {
            String sql = "SELECT * FROM footer";
            SQLQuery query = session.createSQLQuery(sql);
            query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
            footerList = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return footerList;
    }

    @Override
    public void update(Footer footer) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(footer);
        session.flush();
    }

    @Override
    public void delete(Footer footer) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(footer);
        session.flush();
    }

    @Override
    public Footer findById(String parent_footer_id) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        Footer footer = null;
        try {
            footer = (Footer) session.get(Footer.class, parent_footer_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return footer;
    }

    @Override
    public Footer findById(Integer footer_id) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        Footer footer = null;
        try {
            footer = (Footer) session.get(Footer.class, footer_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return footer;
    }

    @Override
    public List<Map<String, Object>> findParentIdByFooterId(Integer footer_id) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        List<Map<String, Object>> parentFooter = null;
        try {
            String sql = "SELECT footer_id as repeat_footer_id, footer_name, footer_url, status FROM footer WHERE parent_footer_id = " + footer_id;
            SQLQuery query = session.createSQLQuery(sql);
            query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
            parentFooter = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parentFooter;
    }

    @Override
    public boolean checkExistByName(String footer_name) {
        try {
            String sanitizedFooterName = footer_name.replace("'", "''");
            String hql = "FROM Footer WHERE footer_name = '" + sanitizedFooterName + "'";
            Footer footer = (Footer) sessionFactory.getCurrentSession()
                .createQuery(hql)
                .setMaxResults(1)
                .uniqueResult();
            return footer != null;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Integer getMaxId() throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        Integer maxId = null;
        try {
            Criteria criteria = session.createCriteria(Footer.class).setProjection(Projections.max("footer_id"));
            maxId = (Integer) criteria.uniqueResult();
            if (maxId == null) {
                maxId = 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            maxId = 0;
        }
        return maxId;
    }

    @Override
    public boolean hasChildFooters(String footerId) {
        String hql = "SELECT COUNT(f) FROM Footer f WHERE f.parent_footer_id = :footer_id";
        Integer count = (Integer) sessionFactory.getCurrentSession()
            .createQuery(hql)
            .setParameter("footer_id", footerId)
            .uniqueResult();
        return count != null && count > 0;
    }

    @Override
    public boolean deleteById(String footerId) {
        String hql = "DELETE FROM Footer f WHERE f.footer_id = :footer_id";
        int result = sessionFactory.getCurrentSession()
            .createQuery(hql)
            .setParameter("footer_id", footerId)
            .executeUpdate();
        return result > 0;
    }

    // Refactored method to dynamically find footer sections by name

	@Override
    public List<Map<String, Object>> findByFooterName(String footerName) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        List<Map<String, Object>> footerList = null;
        try {
            String sql = "SELECT * FROM footer WHERE parent_footer_id = (SELECT footer_id FROM footer WHERE footer_name = :footerName) AND status = 1";
            SQLQuery query = session.createSQLQuery(sql);
            query.setParameter("footerName", footerName);
            query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
            footerList = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return footerList;
    }

	@Override
	public List<Footer> findParent() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Footer> footer = null;
        try {
        	String sql = "SELECT * FROM Footer WHERE parent_footer_id = 0";
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
			String sql = "SELECT * FROM `Footer` WHERE parent_footer_id != 0";
            SQLQuery query = session.createSQLQuery(sql);
            query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
            childFooter = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return childFooter;
	}
}
