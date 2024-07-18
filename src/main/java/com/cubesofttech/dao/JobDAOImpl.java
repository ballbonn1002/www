package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Job;

@Repository
public class JobDAOImpl implements JobDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Job job) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(job);
		session.flush();
	}

	@Override
	public void update(Job job) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(job);
		session.flush();
	}

	@Override
	public void delete(Job job) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(job);
		session.flush();
	}

	@Override
	public Job findById(int jobId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Job job = null;
		try {
			job = (Job) session.get(Job.class, jobId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return job;
	}

	@Override
	public List<Job> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Job> jobList = null;
		try {
			String sql = "SELECT * FROM job ORDER BY name ASC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			jobList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobList;
	}

	@Override
	public List<Job> findAllWithPageUri() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Job> jobList = null;
		try {
			String sql = "SELECT job.*, page_uri.page_uri_id FROM job LEFT JOIN page_uri ON job.job_id = page_uri.model_id ORDER BY job.name ASC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			jobList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobList;
	}

}
