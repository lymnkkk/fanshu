<?php
    require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");

    $voteCat_search=mysql_query("SELECT voteCat,title FROM vote WHERE id='{$_POST['voteId']}'")
        or die ('sql错误'.mysql_error());

    $option=[];
    $i=0;

    $voteCat=mysql_fetch_array($voteCat_search,MYSQL_ASSOC);
    if($voteCat['voteCat'] == 1){
        $vote1_search=mysql_query("SELECT item,voteNum FROM votewithimg WHERE voteId='{$_POST['voteId']}'") or die ('sql错误'.mysql_error());

        while (!!$vote=mysql_fetch_array($vote1_search,MYSQL_ASSOC)) {
            $option[$i]=$vote;
            $i++;
        }

    }else if ($voteCat['voteCat'] == 2) {
        $vote2_search=mysql_query("SELECT item,voteNum FROM votenoimg WHERE voteId='{$_POST['voteId']}'") or die ('sql错误'.mysql_error());

        while (!!$vote=mysql_fetch_array($vote2_search,MYSQL_ASSOC)) {
            $option[$i]=$vote;
            $i++;
        }

    }
    $title_arr=array('title'=>$voteCat['title']);
    $option_arr=array('optionArr'=>$option);
    $results_arr=array_merge($title_arr,$option_arr);
    $results_json=json_encode($results_arr);
    print_r($results_json);

    mysql_close();
?>