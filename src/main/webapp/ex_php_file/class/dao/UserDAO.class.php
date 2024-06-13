<?php

/**

 * Intreface DAO

 *

 * @author: http://phpdao.com

 * @date: 2012-01-27 14:22

 */

interface UserDAO{



	/**

	 * Get Domain object by primry key

	 *

	 * @param String $id primary key

	 * @Return User 

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

 	 * @param user primary key

 	 */

	public function delete($id);

	

	/**

 	 * Insert record to table

 	 *

 	 * @param User user

 	 */

	public function insert($user);

	

	/**

 	 * Update record in table

 	 *

 	 * @param User user

 	 */

	public function update($user);	



	/**

	 * Delete all rows

	 */

	public function clean();



	public function queryByRoleId($value);

	public function queryByDepartmentId($value);

	public function queryByManagerId($value);

	public function queryByImagePath($value);

	public function queryByNameTh($value);

	public function queryByNameEn($value);

	public function queryByNickName($value);

	public function queryByPassword($value);

	public function queryByTel($value);

	public function queryByMobile($value);

	public function queryByEmail($value);

	public function queryByEmailEnable($value);

	public function queryByBirthDate($value);

	public function queryByAddress($value);

	public function queryByStartDate($value);

	public function queryByEnable($value);

	public function queryByTimeCreate($value);

	public function queryByTimeUpdate($value);



	public function deleteByRoleId($value);

	public function deleteByDepartmentId($value);

	public function deleteByManagerId($value);

	public function deleteByImagePath($value);

	public function deleteByNameTh($value);

	public function deleteByNameEn($value);

	public function deleteByNickName($value);

	public function deleteByPassword($value);

	public function deleteByTel($value);

	public function deleteByMobile($value);

	public function deleteByEmail($value);

	public function deleteByEmailEnable($value);

	public function deleteByBirthDate($value);

	public function deleteByAddress($value);

	public function deleteByStartDate($value);

	public function deleteByEnable($value);

	public function deleteByTimeCreate($value);

	public function deleteByTimeUpdate($value);



}

?>