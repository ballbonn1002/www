<?php
/**
 * Class that operate on table 'user'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2011-12-27 10:21
 */
class UserMySqlExtDAO extends UserMySqlDAO{

	public function queryByKey($value){
		$sql = "SELECT *  FROM user where id like '{$value}' or name_th like '{$value}' or name_en like '{$value}'  order by id ASC";
	
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	
	}
	
	
}
?>