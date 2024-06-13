<?php

/**
 * DAOFactory
 * @author: http://phpdao.com
 * @date: ${date}
 */
class DAOFactory{
	
	/**
	 * @return JobDAO
	 */
	public static function getJobDAO(){
		return new JobMySqlExtDAO();
	}

	/**
	 * @return RoleDAO
	 */
	public static function getRoleDAO(){
		return new RoleMySqlExtDAO();
	}

	/**
	 * @return UserDAO
	 */
	public static function getUserDAO(){
		return new UserMySqlExtDAO();
	}


}
?>