#!/bin/bash

work_path=$(dirname $(readlink -f $0))

md_path_theory="${work_path}/md/知识"
md_path_practice="${work_path}/md/实践"

index_file_theory="${work_path}/html/index_theory.md"
index_file_practice="${work_path}/html/index_practice.md"
index="${work_path}/html/index.md"
base_url="index.html?title=";

function createIndex(){
    local files=$(ls $1)
    local index_file=$2
    local level=0;
    local title=$(echo $1 | grep -oP "(?<=/md/).+")
    if [ "$3" == "" ];then
        echo "## $title" > $index_file 
    else level=`expr $3 + 1`;
    fi 

    local space_num="";
    local lever_str="1. ";

    if [ "${level}" == '0' ] ;then
        lever_str="1. ";
    else lever_str="* ";
    fi

    for ((i=0;i<${level};i++))
    do 
        space_num="${space_num}    ";
    done

    for file in ${files[*]}
        do
            local name=$(echo "$file" | grep -oP ".+(?=\\.[^\\.]+\$)")
            local static_site_path=$(echo "$1" | grep -oP "(?<=^$work_path).+")
            if [ -f "$1/$file" ] && [ $file != "index.md" ] ;then
                local path_str="$static_site_path/$name";
                echo "${space_num}${lever_str}[$name](${base_url}$path_str)" >> $index_file
                echo -e "\033[32;5;1m已经创建索引:${path_str}\033[0m"
            elif [ -d "$1/$file" ] ;then
                path_str="$file";
                echo "${space_num}${lever_str}$path_str" >> $index_file
                createIndex "$1/$file" $index_file ${level} 
            fi
        done
}

echo ""
echo -e "\033[32;5;1m开始创建索引\033[0m"

createIndex $md_path_theory $index_file_theory
createIndex $md_path_practice $index_file_practice

echo "## 我的笔记" > $index
html_root=$(echo "$index_file_practice" | grep -oP "(?<=^$work_path).+(?=\.md)")
echo "* [实践](${base_url}${html_root})" >> $index
html_root=$(echo "$index_file_theory" | grep -oP "(?<=^$work_path).+(?=\.md)")
echo "* [知识](${base_url}${html_root})" >> $index

echo -e "\033[32;5;1m索引创建完成\033[0m"
echo ""

