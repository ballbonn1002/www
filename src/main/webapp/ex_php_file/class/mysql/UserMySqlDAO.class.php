<?php
/**
 * Class that operate on table 'user'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2012-01-27 14:22
 */
class UserMySqlDAO implements UserDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return UserMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM user WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM user order by id ASC';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM user ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param user primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM user WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UserMySql user
 	 */
	public function insert($user){
		$sql = 'INSERT INTO user (id,role_id, department_id, manager_id, image_path, name_th, name_en, nick_name, password, tel, mobile, email, email_enable, birth_date, address, start_date, enable, time_create, time_update) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($user->id);
		$sqlQuery->set($user->roleId);
		$sqlQuery->set($user->departmentId);
		$sqlQuery->set($user->managerId);
		$sqlQuery->set($user->imagePath);
		$sqlQuery->set($user->nameTh);
		$sqlQuery->set($user->nameEn);
		$sqlQuery->set($user->nickName);
		$sqlQuery->set($user->password);
		$sqlQuery->set($user->tel);
		$sqlQuery->set($user->mobile);
		$sqlQuery->set($user->email);
		$sqlQuery->set($user->emailEnable);
		$sqlQuery->set($user->birthDate);
		$sqlQuery->set($user->address);
		$sqlQuery->set($user->startDate);
		$sqlQuery->set($user->enable);
		$sqlQuery->set($user->timeCreate);
		$sqlQuery->set($user->timeUpdate);

		$id = $this->executeInsert($sqlQuery);	
		$user->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param UserMySql user
 	 */
	public function update($user){
		$sql = 'UPDATE user SET role_id = ?, department_id = ?, manager_id = ?, image_path = ?, name_th = ?, name_en = ?, nick_name = ?, password = ?, tel = ?, mobile = ?, email = ?, email_enable = ?, birth_date = ?, address = ?, start_date = ?, enable = ?, time_create = ?, time_update = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($user->roleId);
		$sqlQuery->set($user->departmentId);
		$sqlQuery->set($user->managerId);
		$sqlQuery->set($user->imagePath);
		$sqlQuery->set($user->nameTh);
		$sqlQuery->set($user->nameEn);
		$sqlQuery->set($user->nickName);
		$sqlQuery->set($user->password);
		$sqlQuery->set($user->tel);
		$sqlQuery->set($user->mobile);
		$sqlQuery->set($user->email);
		$sqlQuery->set($user->emailEnable);
		$sqlQuery->set($user->birthDate);
		$sqlQuery->set($user->address);
		$sqlQuery->set($user->startDate);
		$sqlQuery->set($user->enable);
		$sqlQuery->set($user->timeCreate);
		$sqlQuery->set($user->timeUpdate);

		$sqlQuery->set($user->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM user';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByRoleId($value){
		$sql = 'SELECT * FROM user WHERE role_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDepartmentId($value){
		$sql = 'SELECT * FROM user WHERE department_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByManagerId($value){
		$sql = 'SELECT * FROM user WHERE manager_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByImagePath($value){
		$sql = 'SELECT * FROM user WHERE image_path = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNameTh($value){
		$sql = 'SELECT * FROM user WHERE name_th = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNameEn($value){
		$sql = 'SELECT * FROM user WHERE name_en = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNickName($value){
		$sql = 'SELECT * FROM user WHERE nick_name = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPassword($value){
		$sql = 'SELECT * FROM user WHERE password = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTel($value){
		$sql = 'SELECT * FROM user WHERE tel = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMobile($value){
		$sql = 'SELECT * FROM user WHERE mobile = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmail($value){
		$sql = 'SELECT * FROM user WHERE email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmailEnable($value){
		$sql = 'SELECT * FROM user WHERE email_enable = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByBirthDate($value){
		$sql = 'SELECT * FROM user WHERE birth_date = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAddress($value){
		$sql = 'SELECT * FROM user WHERE address = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByStartDate($value){
		$sql = 'SELECT * FROM user WHERE start_date = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEnable($value){
		$sql = 'SELECT * FROM user WHERE enable = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTimeCreate($value){
		$sql = 'SELECT * FROM user WHERE time_create = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTimeUpdate($value){
		$sql = 'SELECT * FROM user WHERE time_update = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByRoleId($value){
		$sql = 'DELETE FROM user WHERE role_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDepartmentId($value){
		$sql = 'DELETE FROM user WHERE department_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByManagerId($value){
		$sql = 'DELETE FROM user WHERE manager_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByImagePath($value){
		$sql = 'DELETE FROM user WHERE image_path = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNameTh($value){
		$sql = 'DELETE FROM user WHERE name_th = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNameEn($value){
		$sql = 'DELETE FROM user WHERE name_en = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNickName($value){
		$sql = 'DELETE FROM user WHERE nick_name = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPassword($value){
		$sql = 'DELETE FROM user WHERE password = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTel($value){
		$sql = 'DELETE FROM user WHERE tel = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMobile($value){
		$sql = 'DELETE FROM user WHERE mobile = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmail($value){
		$sql = 'DELETE FROM user WHERE email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmailEnable($value){
		$sql = 'DELETE FROM user WHERE email_enable = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByBirthDate($value){
		$sql = 'DELETE FROM user WHERE birth_date = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAddress($value){
		$sql = 'DELETE FROM user WHERE address = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByStartDate($value){
		$sql = 'DELETE FROM user WHERE start_date = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEnable($value){
		$sql = 'DELETE FROM user WHERE enable = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTimeCreate($value){
		$sql = 'DELETE FROM user WHERE time_create = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTimeUpdate($value){
		$sql = 'DELETE FROM user WHERE time_update = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return UserMySql 
	 */
	protected function readRow($row){
		$user = new User();
		
		$user->id = $row['id'];
		$user->roleId = $row['role_id'];
		$user->departmentId = $row['department_id'];
		$user->managerId = $row['manager_id'];
		$user->imagePath = $row['image_path'];
		$user->nameTh = $row['name_th'];
		$user->nameEn = $row['name_en'];
		$user->nickName = $row['nick_name'];
		$user->password = $row['password'];
		$user->tel = $row['tel'];
		$user->mobile = $row['mobile'];
		$user->email = $row['email'];
		$user->emailEnable = $row['email_enable'];
		$user->birthDate = $row['birth_date'];
		$user->address = $row['address'];
		$user->startDate = $row['start_date'];
		$user->enable = $row['enable'];
		$user->timeCreate = $row['time_create'];
		$user->timeUpdate = $row['time_update'];

		return $user;
	}
	
	protected function getList($sqlQuery){
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
	 * @return UserMySql 
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