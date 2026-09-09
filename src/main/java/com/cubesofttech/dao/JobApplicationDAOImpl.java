package com.cubesofttech.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cubesofttech.model.JobApplication;

@Repository
public class JobApplicationDAOImpl implements JobApplicationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(JobApplication application) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(application);
		session.flush();
	}

	@Override
	@Transactional
	public void update(JobApplication application) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(application);
		session.flush();
	}
}
