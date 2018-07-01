<?php
	require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");


    $voteId_search=mysql_query("SELECT id FROM vote WHERE userId=
        '{$_POST['userId']}' ") or die ('sql错误'.mysql_error());

    $voteIdList=[];
    $m=0;
    while(!!$voteId=mysql_fetch_array($voteId_search,MYSQL_ASSOC)){
        $voteIdList[$m]=$voteId['id'];
        $m++;
    }

    $voteArr=[];
    $index=count($voteIdList);
    for($n=0;$n<$index;$n++){
        
        $vote_search=mysql_query("SELECT id,title FROM vote WHERE 
            id='{$voteIdList[$n]}'") or die ('sql错误'.mysql_error());
        

        if($voteItem=mysql_fetch_array($vote_search,MYSQL_ASSOC)){
            $voteArr[$n]=$voteItem;
        }

    }

    $vote_json=json_encode($voteArr);
    print_r($vote_json);

    mysql_close();
?>