<?php
	require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");

    $pass=sha1($_POST['password']);
    $user_serch=mysql_query("SELECT id FROM user WHERE account='{$_POST['account']}'AND password='$pass' ") or die ('sql错误'.mysql_error());

    $user_id=mysql_fetch_array($user_serch,MYSQL_ASSOC);

    $info_arr=[];

    if($user_id){

    	//获取用户名
    	$info_serch=mysql_query("SELECT name,avatar FROM user_info WHERE userId='{$user_id['id']}' ") or die ('sql错误'.mysql_error());

    	$user_info=mysql_fetch_array($info_serch,MYSQL_ASSOC);
    	
    	$info_arr['id']=$user_id['id'];
    	$info_arr['userName']=$user_info['name'];
    	
    	$json=json_encode($info_arr);

    	echo $json;
    }else{
    	//没有找到用户
    	echo 0;
    }

    mysql_close();
?>