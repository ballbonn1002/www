<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2012-01-27 16:32
 */
interface RoleDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Role 
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
 	 * @param role primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Role role
 	 */
	public function insert($role);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Role role
 	 */
	public function update($role);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByName($value);

	public function queryByDescription($value);

	public function queryByTimeCreate($value);

	public function queryByTimeUpdate($value);


	public function deleteByName($value);

	public function deleteByDescription($value);

	public function deleteByTimeCreate($value);

	public function deleteByTimeUpdate($value);


}
?>