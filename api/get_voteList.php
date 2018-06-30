<?php
	require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");

    $start=$_POST['start'];
    $end=$_POST['end'];

    $length_search=mysql_query("SELECT count(*) FROM vote") or die ('sql错误'.mysql_error());
    $length=mysql_fetch_row($length_search);

    $length_arr=[];
    $length_arr=array('length'=>$length[0]);

    $vote_serch=mysql_query("SELECT id,title FROM vote ORDER BY id DESC LIMIT $start,$end ") or die ('sql错误'.mysql_error());

    $voteArr=[];
    $voteAll=[];
    $i=0;

    while (!!$user_info=mysql_fetch_array($vote_serch,MYSQL_ASSOC)) {
        $voteArr[$i]=$user_info;  
        array_push($voteAll, array_merge($voteArr[$i],$length_arr));
        $i++;
    }
    $vote_json=json_encode($voteAll);
    print_r($vote_json);
    
    mysql_close();
?>