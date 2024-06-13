<?php
/**
 * Class that operate on table 'job'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2011-12-27 14:45
 */
session_start();

class JobMySqlDAO implements JobDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return JobMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM job WHERE job_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM job order by job_id DESC ';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM job ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param job primary key
 	 */
	public function delete($job_id){
		$sql = 'DELETE FROM job WHERE job_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($job_id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param JobMySql job
 	 */
	public function insert($job){
		$sql = 'INSERT INTO job (name, description, position, start_date, end_date, user_create, user_update, time_create, time_update) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
	
		
		$sqlQuery->set($job->name);
		$sqlQuery->set($job->description);
		$sqlQuery->set($job->position);
		$sqlQuery->set($job->startDate);
		$sqlQuery->set($job->endDate);
		$sqlQuery->set($job->userCreate);
		$sqlQuery->set($job->userUpdate);
		$sqlQuery->set($job->timeCreate);
		$sqlQuery->set($job->timeUpdate);

		$id = $this->executeInsert($sqlQuery);	
		$job->jobId = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param JobMySql job
 	 */
	public function update($job){
		$sql = 'UPDATE job SET name = ?, description = ?, position = ?, start_date = ?, end_date = ?, user_create = ?, user_update = ?, time_create = ?, time_update = ? WHERE job_id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($job->name);
		$sqlQuery->set($job->description);
		$sqlQuery->set($job->position);
		$sqlQuery->set($job->startDate);
		$sqlQuery->set($job->endDate);
		$sqlQuery->set($job->userCreate);
		$sqlQuery->set($job->userUpdate);
		$sqlQuery->set($job->timeCreate);
		$sqlQuery->set($job->timeUpdate);

		$sqlQuery->set($job->jobId);
		return $this->executeUpdate($sqlQuery);

		
	
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM job';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByName($value){
		$sql = 'SELECT * FROM job WHERE name = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);

	}

	public function queryByDescription($value){
		$sql = 'SELECT * FROM job WHERE description = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);

	}

	public function queryByPosition($value){
		$sql = 'SELECT * FROM job WHERE position = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByStartDate($value){
		$sql = 'SELECT * FROM job WHERE start_date = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEndDate($value){
		$sql = 'SELECT * FROM job WHERE end_date = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUserCreate($value){
		$sql = 'SELECT * FROM job WHERE user_create = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUserUpdate($value){
		$sql = 'SELECT * FROM job WHERE user_update = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTimeCreate($value){
		$sql = 'SELECT * FROM job WHERE time_create = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTimeUpdate($value){
		$sql = 'SELECT * FROM job WHERE time_update = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByName($value){
		$sql = 'DELETE FROM job WHERE name = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescription($value){
		$sql = 'DELETE FROM job WHERE description = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPosition($value){
		$sql = 'DELETE FROM job WHERE position = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByStartDate($value){
		$sql = 'DELETE FROM job WHERE start_date = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEndDate($value){
		$sql = 'DELETE FROM job WHERE end_date = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUserCreate($value){
		$sql = 'DELETE FROM job WHERE user_create = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUserUpdate($value){
		$sql = 'DELETE FROM job WHERE user_update = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTimeCreate($value){
		$sql = 'DELETE FROM job WHERE time_create = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTimeUpdate($value){
		$sql = 'DELETE FROM job WHERE time_update = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return JobMySql 
	 */
	protected function readRow($row){
		$job = new Job();
		
		$job->jobId = $row['job_id'];
		$job->name = $row['name'];
		$job->description = $row['description'];
		$job->position = $row['position'];
		$job->startDate = $row['start_date'];
		$job->endDate = $row['end_date'];
		$job->userCreate = $row['user_create'];
		$job->userUpdate = $row['user_update'];
		$job->timeCreate = $row['time_create'];
		$job->timeUpdate = $row['time_update'];
		
		return $job;
	}
	
	public function getList($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		$ret = array();
		for($i=0;$i<count($tab);$i++){
			$ret[$i] = $this->readRow($tab[$i]);
		}
	
		return $ret;

	}
	
	/**
	 * Get row
	 *
	 * @return JobMySql 
	 */
	protected function getRow($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		if(count($tab)==0){
			return null;
		}
		return $this->readRow($tab[0]);		
	}
	
	/**
	 * Execute sql query
	 */
	protected function execute($sqlQuery){
		return QueryExecutor::execute($sqlQuery);
	}
	
		
	/**
	 * Execute sql query
	 */
	protected function executeUpdate($sqlQuery){
		return QueryExecutor::executeUpdate($sqlQuery);
	}

	/**
	 * Query for one row and one column
	 */
	protected function querySingleResult($sqlQuery){
		return QueryExecutor::queryForString($sqlQuery);
	}

	/**
	 * Insert row to table
	 */
	protected function executeInsert($sqlQuery){
		return QueryExecutor::executeInsert($sqlQuery);
	}
		
}
?>