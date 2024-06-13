<?php

include 'include_dao.php';

$jobMysqldao = new JobMySqlDAO();
$jobExtDAO = new JobMySqlExtDAO();
$nowdate=date("Y-m-d");
$jobList = $jobExtDAO->queryByShow($nowdate);

?>

            <table width="95%" border="0" cellspacing="0" cellpadding="0" >
                <tr>
                  <td height="25" valign="bottom"><img src="images/icon_cube.gif" width="16" height="16"> <span class="thead_red">Job</span> <span class="thead_gray">Vacancies</span>  </td>
                </tr>
                <tr>
                  <td height="1" bgcolor="#CCCCCC"></td>
                </tr>
              </table>
              
              <table width="95%" border="0" cellspacing="0" cellpadding="0" bgcolor="#F5F5F5">
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><div><table width="170" border="0" cellspacing="1" cellpadding="0">
 					<?php 
                    for($i=0; $i<sizeof($jobList); $i++) {
                    	$jobMenu = $jobList[$i];	
                    ?>
                    	<tr>
                      		<td width="20" valign="middle" class="tnormal_gray">
                      		<td height="25" valign="middle" class="tnormal_gray">
                      		<a href="cube-softtech-job-detail.php?jobid=<?=$jobMenu->jobId ?>&name=<?=$job->position ?>"><?=$jobMenu->position ?> 
                      		</a>
                      		</td>
                    	</tr>
                    
                    <?php 
                    }
                    ?>
	                <tr>
	                  <td>&nbsp;</td>
	                </tr>                    
                  </table></div></td>
                </tr>
              </table>
              <table width="95%">
              <tr><td>
              		<div class="table_row_1" >
	              For interested person, 
	              you can contact 
	              <br>
	              Tel : 088 022 9401
	              <br>
	              Email : <a href="mailto:hr@cubesofttech.com">hr@cubesofttech.com</a>

					</div>
              </td></tr>
              </table>
                            
                                 