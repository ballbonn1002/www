package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Job;

public interface JobDAO {
	void save(Job job) throws Exception;
	
	void update(Job job) throws Exception;
	
	void delete(Job job) throws Exception;
	
	public Job findById(int jobId) throws Exception; 
	
	public List<Job> findAll() throws Exception;
	
	public List<Job> findAllWithPageUri() throws Exception;

}
