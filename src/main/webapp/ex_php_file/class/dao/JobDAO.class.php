<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2011-12-27 14:45
 */
interface JobDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Job 
	 */
	public function load($id);

	/**
	 * Get all records from table
	 */
	public function queryAll();
	
	/**
	 * Get all records from table ordered by field
	 * @Param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn);
	
	/**
 	 * Delete record from table
 	 * @param job primary key
 	 */
	public function delete($job_id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Job job
 	 */
	public function insert($job);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Job job
 	 */
	public function update($job);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByName($value);

	public function queryByDescription($value);

	public function queryByPosition($value);

	public function queryByStartDate($value);

	public function queryByEndDate($value);

	public function queryByUserCreate($value);

	public function queryByUserUpdate($value);

	public function queryByTimeCreate($value);

	public function queryByTimeUpdate($value);


	public function deleteByName($value);

	public function deleteByDescription($value);

	public function deleteByPosition($value);

	public function deleteByStartDate($value);

	public function deleteByEndDate($value);

	public function deleteByUserCreate($value);

	public function deleteByUserUpdate($value);

	public function deleteByTimeCreate($value);

	public function deleteByTimeUpdate($value);


}
?>