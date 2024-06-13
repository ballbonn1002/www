<?php
include '../include_dao.php';
class value{


	public function  checkvalue($name,$position,$start,$theend,$description,$jobid,$user,$time){
		$jobaddAction = new jobadd();
		$jobeditAction = new jobedit();
		
				if($_GET['page']=="editjob"){
					$jobeditAction->update($jobid, $name, $position, $start, $theend, $description, $user, $time);
				}
				else if	($_GET['page']=="addjob"){
						$jobaddAction->add($name, $position, $start, $theend, $description);
				}
				else {
					header("Location:../login.php");
				}
	}


	public function valueUser($name,$startdate,$nameth,$nameeng,$nick,$birthday,$role,$enable,$department
	,$manager,$tel,$mobile,$email,$mailenable,$image,$pass,$address,$oldpassword,$create ){

			
 			$useraddAction = new useradd();
			$usereditAction = new useredit();
			if ($birthday==""){$birthday=date("d-m-Y");}
			
				if($_GET['page']=="edituser"){
					if($pass !=$oldpassword)
					{
						$pass=md5($pass);
					}
					else {$pass=$oldpassword;
					}
					$usereditAction->update($name,$startdate,$nameth,$nameeng,$nick,date("Y-m-d",strtotime($birthday))
						,$role,$enable,$department,$manager,$tel,$mobile,$email,$mailenable,
						$image,$pass,$address,$create);
				}
				else if		($_GET['page']=="adduser"){

					$useraddAction->add($name, $startdate, $nameth, $nameeng, $nick, date("Y-m-d",strtotime($birthday)), $role,
					 $enable, $department, $manager, $tel, $mobile, $email, $mailenable, $image, md5($pass), $address);
				}
				else {
					header("Location:../login.php");
				}
			
		
	}
}


?>