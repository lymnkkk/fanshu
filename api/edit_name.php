<?php
	require 'config.php';

	header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");


    $name_update=mysql_query("UPDATE user_info SET name='{$_POST['userName']}' WHERE userId='{$_POST['userId']}'") or die ('sql错误'.mysql_error());

    echo $_POST['userName'];
    
	mysql_close();
?>