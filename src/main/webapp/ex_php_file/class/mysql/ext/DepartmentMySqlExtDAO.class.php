<?php
/**
 * Class that operate on table 'department'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2012-02-01 10:59
 */
class DepartmentMySqlExtDAO extends DepartmentMySqlDAO{

	
	public function queryDepfromID($id){
	$sql = 'SELECT * FROM `department` , `user` where  department.id = user.department_id and user.id= ?';
	$sqlQuery = new SqlQuery($sql);
	$sqlQuery->set($id);
	return $this->getDep($sqlQuery);
	}
	
	
	protected function readDep($row){
		$department = new Department();
		
		$department->id = $row['id'];
		$department->name = $row['name'];
		$department->description = $row['description'];
		$department->timeCreate = $row['time_create'];
		$department->timeUpdate = $row['time_update'];
		
		return $department;
	
	}
	
	protected function getDep($sqlQuery){

		$tab = QueryExecutor::execute($sqlQuery);
		$ret = array();
		for($i=0;$i<count($tab);$i++){
			$ret[$i] = $this->readDep($tab[$i]);
		}

		return $ret;		
	}
}
?>