
<html xmlns="http://www.w3.org/1999/xhtml">

<!DOCTYPE html>
<html>

<head>
    <title>Cube SoftTech</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
        integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
    <link rel="stylesheet" type="text/css" href="css/style.css">
	    
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NF235VW');</script>
<!-- End Google Tag Manager -->

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-25549236-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-25549236-1');
</script>


    <style>
        body,
        html {
            font-family: 'Open Sans', sans-serif;
            font-size: 15px;
            scroll-behavior: smooth;
			 background-image: url("img/job/bg.jpg");

            /* Set a specific height */
            min-height: 500px;

            /* Create the parallax scrolling effect */
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
		.sendcontact{
			
            margin-left: 15%;
            margin-right: 15%;
            margin-top: 10%;
			margin-bottom: 10%;
            padding-left: 2%;
            padding-right: 2%;
            padding-bottom: 2%;
            padding-top: 2%;
			background-color:white;
			box-shadow: 0px 11px 18px -16px rgba(0, 0, 0, 0.75);
		}

    </style>
</head>

<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NF235VW"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

	<div class="sendcontact">
	<?php

	require_once('common/setEmail/Rmail.php');
	require_once('class/context/Constant.class.php');


	$message='Position :'.$_POST['contactPosition'].' Telphone '.$_POST['contactTel'];
	
	$mail = new Rmail();
	$mail->setFrom($_POST['contactEmail']);
	$mail->setSubject('[cubesofttech] apply job : '.$_POST['contactPosition']);
	$mail->setText('simple text');
	$mail->setHTML('<font style=\'font-family:tahoma; font-size:18px\' >Name : '.$_POST['contactName'].'<br>Position :'.$_POST['contactPosition'].'<br>Email :'.$_POST['contactEmail'].'<br>Telphone '.$_POST['contactTel'].'<br>Message '.$_POST['contactMessage'].'</font>');
	$mail->setReceipt('');

	if ($_FILES["file"]["name"]!=""){
		if($_FILES["file"]["error"] > 0){
		
				print  "<p>Error Sending File</p>";
				$send=0;
		}
		else if($_FILES["file"]["size"] <= 10485760){
			//10Mb

			if (strpos($_FILES["file"]["type"],"octet-stream")>'0')
			{

				$send=0;
				print  "<p>Cannot attached .exe file </p>";
			}
			else {

				$attachFile = new fileAttachment($_FILES["file"]["tmp_name"]);
				$attachFile->name = $_FILES["file"]["name"];
				$mail->addAttachment($attachFile);
				
				$send=1;
			}
			
		}
		else print  "<p>attached file</p>";
	}
	else {	
		$send=1;
	}
	
	if($send==1){
		$address = 	Constant::$EMAIL_HR;;
		$result  = $mail->send(array($address));
	}
	//  unlink( $path); // ลบรายการ attachement ออกจาก server

	if(($result=="true")&&($_FILES["file"]["error"] <=0)){
		print "<center><p>Sending email with Attachment ...</p>";
		print "<center><meta http-equiv='refresh' content='3;URL=job.php'/>";
	}
	else if ($_FILES["file"]["error"] ==0) {
		print " <center><p>Sending email ...</p>";
		print "<meta http-equiv='refresh' content='1;URL=job.php'/>";
	}
	else {	If ($_FILES["file"]["name"]=="") {
		print "<center><p>Now Sending email ...</p>";}
		print "<center><meta http-equiv='refresh' content='1;URL=job.php'/>";
	}
	

	?>

	</div>

</body>
</html>
