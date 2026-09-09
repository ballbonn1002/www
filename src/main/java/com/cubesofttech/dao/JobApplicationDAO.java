package com.cubesofttech.dao;

import com.cubesofttech.model.JobApplication;

public interface JobApplicationDAO {

	void save(JobApplication application) throws Exception;

	void update(JobApplication application) throws Exception;
}
