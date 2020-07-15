#!/bin/bash

work_path=$(dirname $(readlink -f $0))
md_path="${work_path}/note/md"

function createIndex(){
    local files=$(ls $1)
    local index_path="$1/index.md"
    local title=$(echo $1 | grep -oP "[^/]+\$")
    if [ "$title" == "md" ];then
        title="我的笔记"
    fi
    echo "## $title" > $index_path
    for file in ${files[*]}
        do
            local name=$(echo "$file" | grep -oP ".+(?=\\.[^\\.]+\$)")
            local static_site_path=$(echo "$1" | grep -oP "(?<=^$work_path).+")
            if [ -f "$1/$file" ] && [ $file != "index.md" ] ;then
                echo "1. [$name]($static_site_path/$name)" >> $index_path
            elif [ -d "$1/$file" ] ;then
                echo "1. [$file]($static_site_path/$file/index)" >> $index_path
                createIndex "$1/$file"
            fi
        done
    echo -e "\033[32;5;1m已经创建索引:$index_path\033[0m"
}

echo ""
echo -e "\033[32;5;1m开始创建索引\033[0m"
createIndex $md_path
cp $md_path/index.md $work_path
echo -e "\033[32;5;1m索引创建完成\033[0m"
echo ""

