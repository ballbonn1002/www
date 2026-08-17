package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Job;

public interface JobDAO {
	public Job findById(int jobId) throws Exception;

	public List<Job> findAllWithPageUri() throws Exception;

}
