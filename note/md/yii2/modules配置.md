# modules配置

## 目录结构 
* 模块根目录：`app\modules`
* 设模块名称为：`user`，则模块类名为：`User`，模块类文件名为：`User.php`
* 结构：
    ```
    user/                            app\modules\user文件夹
        controllers/                 包含控制器类文件 
        models/                      包含模型类文件
            DefaultController.php    default 控制器类文件
        views/                       包含控制器视图文件和布局文件
            layouts/                 包含布局文件
            default/                 包含 DefaultController 控制器视图文件
                index.php            index 视图文件
        User.php                     模块类文件  
    ```