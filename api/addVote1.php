<?php
	require 'config.php';

	header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");

   
    $json_get=file_get_contents('php://input');
    $json_arr=json_decode($json_get,true);
    
    echo $json_arr['voteCat'];
    $vote_insert=mysql_query("INSERT INTO vote(title,voteCat,userId) VALUES ('{$json_arr['title']}','{$json_arr['voteCat']}','{$json_arr['userId']}')") or die ('sql错误'.mysql_error());
    
    if(mysql_affected_rows()){
        if($json_arr['voteCat'] == 1){

            //获取新增数据的id
            $id=mysql_insert_id();
            echo $id;

            //计算选项的数量
            $voteArr=$json_arr['voteArr'];
            $count=count($voteArr);

            for($i=0;$i<$count;$i++){
                $item=$voteArr[$i]['value'];
                $img=$voteArr[$i]['img'];

                $voteWithImg_insert=mysql_query("INSERT INTO votewithimg(item,img,voteId) VALUES ('$item','$img','$id')") or die ('sql错误'.mysql_error());
            }
            /*
            $voteWithImg_insert=mysql_query("INSERT INTO votewithimg(item,img) VALUES ()") or die ('sql错误'.mysql_error());
            */
        }else if($json_arr['voteCat'] == 2){
            $id=mysql_insert_id();
            echo $id;

            $voteArr=$json_arr['voteArr'];
            $count=count($voteArr);

            for($i=0;$i<$count;$i++){
                $item=$voteArr[$i];

                $voteWithImg_insert=mysql_query("INSERT INTO votenoimg(item,voteId) VALUES ('$item','$id')") or die ('sql错误'.mysql_error());
            }
        }
    }

    /*
    $article_insert=mysql_query("INSERT INTO vote(title) VALUES ()");

    echo mysql_affected_rows();
    */
	mysql_close();
?>