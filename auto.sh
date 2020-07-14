#!/bin/bash

work_path="$(dirname $(readlink -f $0))/note/md";

echo  $work_path
exit;
createIndexMd($work_path);
printLog("处理完成");

function createIndexMd(string $work_path,string $page_system_path="",string $page_now_dir="note",string $index_file_name="index"){ 
    if(!is_dir($work_path)){
        printLog("索引添加失败:{$work_path}不是一个有效目录");
        return false;
    }
    if($page_system_path==="")$page_system_path=getcwd();

    $first_dir=$page_system_path.DIRECTORY_SEPARATOR.$page_now_dir;
    $page_base_dir=preg_replace("/^".preg_quote("$page_system_path","/")."/u","",$work_path);

    preg_match("{([^\\\\/]+)\$}u",$work_path,$match);
    if($work_path==$first_dir){
        $head="我的笔记";
    }else{
        $head=isset($match[1])?$match[1]:"索引";
    }
    $content="## ".$head."\n";

    $current_file=$work_path.DIRECTORY_SEPARATOR.$index_file_name.".md";
    if(is_file($current_file)){
        $old_content=file_get_contents($current_file);
        $rows=preg_split("{\\n|\\n\\r|\\r}u",$old_content,-1,PREG_SPLIT_NO_EMPTY);
        foreach($rows as $row){
            if( empty(trim($row))||
                preg_match("{^##}u",$row)||
                preg_match("{".preg_quote($page_base_dir,"/")."/}u",$row) 
            )continue;
            $content.=$row."\n";
        }
    }

    $res=[];
    array_map(function($name)use($work_path,&$res,$index_file_name){
        if(empty($res))$res=["dir"=>[],"file"=>[]];
        if(is_dir($work_path.DIRECTORY_SEPARATOR.$name)&&!preg_match("{^\\.}u",$name)){
            $res['dir'][]=$name;
        }elseif(is_file($work_path.DIRECTORY_SEPARATOR.$name)&&$name!=$index_file_name.".md"&&preg_match("{\\.md\$|\\.html\$}u",$name)){
            $res['file'][]=$name;
        }
    },scandir($work_path));

    foreach($res['dir'] as $row){
        $title=$row;
        $file_name="{$row}/{$index_file_name}";
        $content.="1. [{$title}]({$page_base_dir}/$file_name)\n";
    }

    foreach($res['file'] as $row){
        preg_match("{([^\\\\/]+)\\.[mdhtml]+\$}u",$row,$match);
        $title=$match[1];
        $file_name=$match[1];
        $content.="1. [{$title}]({$page_base_dir}/$file_name)\n";
    }
        
    file_put_contents($current_file,$content);
    if($work_path==$first_dir){
        file_put_contents($page_system_path.DIRECTORY_SEPARATOR.$index_file_name.".md",$content);
        printLog("索引添加成功:{$page_system_path}".DIRECTORY_SEPARATOR."{$index_file_name}.md");
    }
    printLog("索引添加成功:{$work_path}".DIRECTORY_SEPARATOR."{$index_file_name}.md");

    foreach($res['dir'] as $row){
        createIndexMd($work_path.DIRECTORY_SEPARATOR.$row,$page_system_path);
    }

    return true;
} 
function printLog($content){
    print_r("[".date("Y-m-d H:i:s")."]:".$content."\n");
}
