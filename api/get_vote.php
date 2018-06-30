<?php
	require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");

    $vote_serch=mysql_query("SELECT id,title,userId,voteCat FROM vote WHERE id='{$_POST['voteId']}'") or die ('sql错误'.mysql_error());

    $voteArr=[];
    $optionArr=[];


    if($user_info=mysql_fetch_array($vote_serch,MYSQL_ASSOC)) {
        $voteArr=$user_info;
        
        if($user_info['voteCat']==1){
            //有图投票
            $option_search=mysql_query("SELECT item,img,voteNum FROM votewithimg WHERE voteId='{$user_info['id']}'") or die ('sql错误'.mysql_error());

            $j=0;

            while (!!$option_info=mysql_fetch_array($option_search,MYSQL_ASSOC)) {
                $optionArr[$j]=$option_info;

                $j++;
            }
            $option=array('optionArr'=>$optionArr);
            

        }else{
            $option_search=mysql_query("SELECT item,voteNum FROM votenoimg WHERE voteId='{$user_info['id']}'") or die ('sql错误'.mysql_error());

            $j=0;

            while (!!$option_info=mysql_fetch_array($option_search,MYSQL_ASSOC)) {
                $optionArr[$j]=$option_info;

                $j++;
            }
            $option=array('optionArr'=>$optionArr);
        }
        
        $vote=array_merge($voteArr,$option);
        

    }
    $vote_json=json_encode($vote);
    print_r($vote_json);
    

    mysql_close();
?>