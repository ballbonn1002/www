package com.cubesofttech.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cubesofttech.model.ContactMessage;

@Repository
public class ContactMessageDAOImpl implements ContactMessageDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(ContactMessage message) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(message);
		session.flush();
	}
}
