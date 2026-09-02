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
	public Job findById(int jobId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Job job = null;
		try {
			job = (Job) session.get(Job.class, jobId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return job;
	}

	@Override
	public List<Job> findAllJobsWithPageUri() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Job> jobList = null;
		try {
			// Filters out colliding article/blog rows sharing this job's model_id;
			// NULL/'%career%' still includes jobs with no URL slug yet.
			String sql = "SELECT job.position, page_uri.page_uri_id FROM job LEFT JOIN page_uri ON job.job_id = page_uri.model_id "
					+ "WHERE page_uri.page_uri_id IS NULL OR page_uri.page_uri_id LIKE '%career%' ORDER BY job.name ASC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			jobList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobList;
	}

}
