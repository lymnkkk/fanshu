<?php
	require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");



    $voteId_search=mysql_query("SELECT voteId FROM vote_user WHERE userId=
        '{$_POST['userId']}' ") or die ('sql错误'.mysql_error());

    $voteIdList=[];
    $m=0;
    while(!!$voteId=mysql_fetch_array($voteId_search,MYSQL_ASSOC)){
        $voteIdList[$m]=$voteId['voteId'];
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

    /*
    $voteArr=[];
    $optionArr=[];
    $index=count($voteIdList);
    $option=[];
    $voteAll=[];
    for($n=0;$n<$index;$n++){
        
        $vote_search=mysql_query("SELECT id,title,userId,voteCat FROM vote WHERE 
            id='{$voteIdList[$n]}'") or die ('sql错误'.mysql_error());
        

        if($voteItem=mysql_fetch_array($vote_search,MYSQL_ASSOC)){
            $voteArr[$n]=$voteItem;

            if($voteItem['voteCat']==1){   
                //有图投票
                $option_search=mysql_query("SELECT item,img,voteNum FROM votewithimg WHERE voteId='{$voteItem['id']}'") or die ('sql错误'.mysql_error());

                $j=0;

                while (!!$option_info=mysql_fetch_array($option_search,MYSQL_ASSOC)) {
                    $optionArr[$j]=$option_info;

                    $j++;
                }
                $option[$n]=array('optionArr'=>$optionArr);
                

            }else{
                $option_search=mysql_query("SELECT item,voteNum FROM votenoimg WHERE voteId='{$voteItem['id']}'") or die ('sql错误'.mysql_error());

                $j=0;

                while (!!$option_info=mysql_fetch_array($option_search,MYSQL_ASSOC)) {
                    $optionArr[$j]=$option_info;

                    $j++;
                }
                $option[$n]=array('optionArr'=>$optionArr);
            }
        }

        $vote=array_merge($voteArr[$n],$option[$n]);
        array_push($voteAll, $vote);
        //清空数组
        $optionArr=[];
    }

    $vote_json=json_encode($voteAll);
    print_r($vote_json);
    /*
    $vote_serch=mysql_query("SELECT id,title,userId,voteCat FROM vote LIMIT 0,3") or die ('sql错误'.mysql_error());

    $voteArr=[];
    $optionArr=[];
    $voteAll=[];
    $i=0;

    while (!!$user_info=mysql_fetch_array($vote_serch,MYSQL_ASSOC)) {
        $voteArr[$i]=$user_info;
        
        if($user_info['voteCat']==1){   
            //有图投票
            $option_search=mysql_query("SELECT item,img,voteNum FROM votewithimg WHERE voteId='{$user_info['id']}'") or die ('sql错误'.mysql_error());

            $j=0;

            while (!!$option_info=mysql_fetch_array($option_search,MYSQL_ASSOC)) {
                $optionArr[$j]=$option_info;

                $j++;
            }
            $option[$i]=array('optionArr'=>$optionArr);
            

        }else{
            $option_search=mysql_query("SELECT item,voteNum FROM votenoimg WHERE voteId='{$user_info['id']}'") or die ('sql错误'.mysql_error());

            $j=0;

            while (!!$option_info=mysql_fetch_array($option_search,MYSQL_ASSOC)) {
                $optionArr[$j]=$option_info;

                $j++;
            }
            $option[$i]=array('optionArr'=>$optionArr);
        }
        
        $vote=array_merge($voteArr[$i],$option[$i]);
        array_push($voteAll, $vote);
        $i++;
        //清空数组
        $optionArr=[];
    }
    $vote_json=json_encode($voteAll);
    print_r($vote_json);
    
    */

    mysql_close();
?>