# Composer

## 安装
* `Composer`依赖
    * ` php `
    * `php-zip` 
    * `php-curl`
    * `php-dom`
    * `php-mbstring`
* ubuntu
    * 第一步
        ```
        curl -sS https://getcomposer.org/installer | php
        ```
    * 第二步，添加到环境变量 
        * `ubuntu、debian、centos`
            ```
            mv composer.phar /usr/local/bin/composer
            ```
        * 通用。添加到`/etc/profile`，详见`linux.md`中环境变量相关内容
* windows
    * 下载并安装：`https://getcomposer.org/Composer-Setup.exe`

## 更换、还原源地址
* 更换
    * 语法
        ```
        composer config -g repo.packagist composer URL 
        ```
    * 解释 
        * URL：镜像地址，有以下地址可用：
            1. `https://mirrors.aliyun.com/composer/`
            1. `https://packagist.mirrors.sjtug.sjtu.edu.cn`
            1. `https://mirrors.huaweicloud.com/repository/php/`
            1. `https://mirrors.cloud.tencent.com/composer/`
            1. `https://packagist.phpcomposer.com`
* 还原：`composer config -g --unset repos.packagist`

    




