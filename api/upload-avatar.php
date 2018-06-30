<?php
    header("Access-Control-Allow-Origin:*");
    header('Access-Control-Allow-Method:POST,GET');//允许访问的方式 　
    header("Access-Control-Allow-Credentials: true");
    
    
    function mkdirs($dir, $mode = 0777){
            if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
            if (!mkdirs(dirname($dir), $mode)) return FALSE;
            return @mkdir($dir, $mode);
        } 
    $savename = date('YmdHis',time()).mt_rand(0,9999).'.jpg';//
   
    $imgdirs = "../assets/article/";
    mkdirs($imgdirs);
   
    $savepath = $imgdirs.$savename; 
    $data['data'] = $savepath; 
    move_uploaded_file($_FILES['file']['tmp_name'],$savepath);
    print_r(json_encode($data));
   
?>  