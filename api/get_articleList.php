<?php
    require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");

    $start=$_POST['start'];

    $length_search=mysql_query("SELECT count(*) FROM article ") or die ('sql错误'.mysql_error());
    $length=mysql_fetch_row($length_search);

    $length_arr=[];
    $length_arr=array('length'=>$length[0]);
     

    $article_search=mysql_query("SELECT id,headerImg,title,cat,userId,createdAt FROM article ORDER BY createdAt DESC LIMIT $start,3 ") or die ('sql错误'.mysql_error());

    $articleArr=[];
    $articleAll=[];

    $i=0;
    while(!!$article_info=mysql_fetch_array($article_search,MYSQL_ASSOC)){

        $articleArr[$i]=$article_info;

        /*
        $user_search=mysql_query("SELECT name FROM user_info WHERE userId
            ='{$article_info['userId']}'") or die ('sql错误'.mysql_error());

        if($user_info=mysql_fetch_array($user_search,MYSQL_ASSOC)){
            $userName[$i]=array('userName'=>$user_info['name']);
        }

        $article=array_merge($articleArr[$i],$userName[$i]);
        array_push($articleAll, $article);
        
        */

        array_push($articleAll,array_merge($articleArr[$i],$length_arr));
        $i++;
    }
    $article_json=json_encode($articleAll);
    print_r($article_json);
    mysql_close();
?>