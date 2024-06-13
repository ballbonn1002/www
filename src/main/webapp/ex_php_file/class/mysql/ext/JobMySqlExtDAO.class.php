<?php
/**
 * Class that operate on table 'job'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2011-12-27 10:21
 */
class JobMySqlExtDAO extends JobMySqlDAO{

	public function queryByKey($value){
		$sql = "SELECT *  FROM job where job_id like '{$value}' or name like '{$value}' or description like '{$value}' or position like '{$value}' order by job_id DESC";
	
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	
	}
	
	
	public function queryByShow($nowdate){
		$sql = "SELECT * FROM job WHERE end_date >= '{$nowdate}' AND start_date <= '{$nowdate}' order by job_id DESC ";
	
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	
	}
}
?>