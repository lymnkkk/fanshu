<?php
    require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");

    $article_search=mysql_query("SELECT id,headerImg,title,content,cat,userId,createdAt FROM article WHERE userId='{$_POST['userId']}'") or die ('sql错误'.mysql_error());

    $articleArr=[];
    $userName=[];
    $article=[];
    $articleAll=[];
    $i=0;
    while(!!$article_info=mysql_fetch_array($article_search,MYSQL_ASSOC)){

        $articleArr[$i]=$article_info;

        $user_search=mysql_query("SELECT name FROM user_info WHERE userId
            ='{$article_info['userId']}'") or die ('sql错误'.mysql_error());

        if($user_info=mysql_fetch_array($user_search,MYSQL_ASSOC)){
            $userName[$i]=array('userName'=>$user_info['name']);
        }

        $article=array_merge($articleArr[$i],$userName[$i]);
        array_push($articleAll, $article);
        $i++;
    }
    $article_json=json_encode($articleAll);
    print_r($article_json);
    mysql_close();
?>