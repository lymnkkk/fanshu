<?php
    require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");

    //查找对应的用户的投票是否存在
    $voteUser_search=mysql_query("SELECT id FROM vote_user WHERE userId='{$_POST['userId']}' AND voteId='{$_POST['voteId']}'") or die ('sql错误'.mysql_error());

    $voteUser_info=mysql_fetch_array($voteUser_search,MYSQL_ASSOC);

    if($voteUser_info){
        //存在
        echo 1;
    }else{
        //不存在
        echo 0;
    }

    mysql_close();  
?>