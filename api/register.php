<?php
	require 'config.php';

    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers:Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE");
    
    $query_select=mysql_query("SELECT account FROM user WHERE account = '{$_POST['account']}'
    	") or die ('SQL错误'.mysql_error());
    
    $row=mysql_fetch_array($query_select,MYSQL_ASSOC);

    if($row){
    	//@header('Http/1.0 409 服务器在完成请求时发生冲突。');

        //冲突
    	echo 0;
        
    }else{

    	$query_insert=" INSERT INTO user(account,password) VALUES ('{$_POST['account']}',sha1('{$_POST['password']}'))";

	    mysql_query($query_insert) or die ('新增失败'.mysql_error());

	    if(mysql_affected_rows()){
            //返回id
            $id= mysql_insert_id();
	    	
            //初始化user_info表数据
            $info_insert="INSERT INTO user_info(name,avatar,userId) VALUES ('{$_POST['account']}','../assets/avatar.png',$id) ";

            mysql_query($info_insert);
            
            $info_arr['id']=$id;
            $info_arr['userName']=$_POST['account'];
        
            $json=json_encode($info_arr);

            echo $json;

            

            
	    }
    }

    mysql_close();
?>