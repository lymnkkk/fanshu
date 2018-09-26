<?php
	require 'config.php';

	header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");

    print_r($_POST);

    $article_insert=mysql_query("INSERT INTO article(headerImg,title,content,cat,userId) VALUES ('{$_POST['headerImg']}','{$_POST['title']}','{$_POST['content']}','{$_POST['cat']}','{$_POST['userId']}')") or die ('sql错误'.mysql_error());

    echo mysql_affected_rows();
    
	mysql_close();
?>