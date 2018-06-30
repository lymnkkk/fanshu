<?php
	require 'config.php';

	header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");

   

   	$option=[];
   	$i=0;
   	if($_POST['voteCat']==1){

    	$vote1_insert=mysql_query("UPDATE votewithimg SET voteNum=voteNum+1 WHERE voteId = '{$_POST['voteId']}' AND item='{$_POST['voteItem']}' ") or die ('sql错误'.mysql_error());

    	echo mysql_affected_rows();
   	}else if($_POST['voteCat']==2){
   		$vote2_insert=mysql_query("UPDATE votenoimg SET voteNum=voteNum+1 WHERE voteId = '{$_POST['voteId']}' AND item='{$_POST['voteItem']}' ") or die ('sql错误'.mysql_error());

    	echo mysql_affected_rows();
   	}
   	
    $vote_user=mysql_query("INSERT INTO vote_user(userId,voteId) VALUES('{$_POST['userId']}','{$_POST['voteId']}')") or die ('sql错误'.mysql_error());

	mysql_close();
?>