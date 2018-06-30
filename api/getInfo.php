<?php
	require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");


    $info_serch=mysql_query("SELECT name,avatar FROM user_info WHERE userId='{$_POST['userId']}' ") or die ('sql错误'.mysql_error());

    $user_info=mysql_fetch_array($info_serch,MYSQL_ASSOC);

    $response_str='';
    if($user_info){

        $response_str.=json_encode($user_info);
        echo $response_str;
        
    }else{
    	//没有找到用户信息
    	echo 0;
    }

    mysql_close();
?>