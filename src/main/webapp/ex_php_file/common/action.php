<?php
include '../include_dao.php';
include '../page_back/action/loginAction.php';
include '../page_back/action/onlineAction.php';
include '../page_back/action/jobAction.php';
include '../page_back/action/userAction.php';
include '../common/checkvalue.php';

$check = new check();
$online = new checkkeyword();
$jobaddAction = new jobadd();
$jobeditAction = new jobedit();
$jobdeleteAction = new jobdelete();
$checkvalue = new value();
$show=new announced();
$userdelete = new userdelete();
$useredit=new useredit();
$roleMysqldao = new RoleMySqlDAO();
$departmentMySqlDAO = new  DepartmentMySqlDAO ();

if ($_SESSION['status']!="true"){
	$check->login();	
}
else {
	if ($_GET['page']=="joblist"){
		$online->thekey($_POST['keyword']);
	}
	else if($_GET['page']=="addjob"){
		$checkvalue->checkvalue($_POST['name'],$_POST['position'], $_POST['start'], $_POST['theend'], $_POST['description'], $_POST['jobid'], "", "");
	}
	else if(($_GET['page']=="jobedit")||($_GET['page']=="lookjob")||($_GET['page']=="applyjob")){
		$jobeditAction->choose($_GET['jobid'],$_GET['page']);
	}
	else if($_GET['page']=="editjob"){
		$checkvalue->checkvalue($_POST['name'],$_POST['position'], $_POST['start'], $_POST['theend'], $_POST['description'], $_POST['jobid'], $_POST['user'], $_POST['time']);	
	}
	else if($_GET['page']=="deletejob"){
		$jobdeleteAction->delete($_GET['jobid']);
	}
	else if($_GET['page']=="jobshow"){
		$show->jobAnnounced();
	}
	else if($_GET['page']=="userlist"){
		$online->userlist($_POST['keyword']);
	}
	else if($_GET['page']=="useredit"){
		$useredit->choose($_GET['id']);
	}
	else if($_GET['page']=="edituser"){
		$checkvalue->valueUser($_POST['user'],$_POST['startdate'], $_POST['nameth'], $_POST['nameeng'],
		 $_POST['nick'], $_POST['birthday'], $_POST['role'], $_POST['enable'], $_POST['department'],
		 $_POST['manager'], $_POST['tel'], $_POST['mobile'],$_POST['email'], $_POST['mailenable'], $_POST['image'],
		$_POST['pass'], $_POST['address'],$_POST['oldpassword'],$_POST['create']);
	}
	else if($_GET['page']=="adduser"){
	$checkvalue->valueUser($_POST['username'],"", $_POST['nameth'], $_POST['nameeng'],
		 $_POST['nick'], $_POST['birthday'], $_POST['role'], $_POST['enable'], $_POST['department'],
		 $_POST['manager'], $_POST['tel'], $_POST['mobile'],$_POST['email'], $_POST['mailenable'], $_POST['image'],
		$_POST['pass'], $_POST['address'],"","");
	}
	else if($_GET['page']=="deleteuser"){
		$userdelete->delete($_GET['id']);
	}
    else if($_GET['page']=="logout"){
		$check->logout();
	}
}


?>