## windows terminal
* 配置终端
    1. 点击标题栏中的"V"下拉按钮
    1. 点击设置，找到`profiles->list`，`list`所表示的是一个数组，数组中由json对象作为元素
    1. 在`list`中创建json对象元素，`list`项示例如下：
        * 配置示例
            ```json
            "list":
            [
                {
                    "guid": "{2c4de342-38b7-51cf-b940-000000000002}",
                    "hidden": false,
                    "name": "vm-debian",
                    "tabTitle": "vm-debian",
                    "suppressApplicationTitle":true,
                    "commandline": "ssh vm-debian"
                },
                {
                    "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                    "hidden": false,
                    "name": "PowerShell",
                    "tabTitle": "PowerShell",
                    "suppressApplicationTitle":true,
                    "commandline": "powershell.exe"
                }
            ]
            ```
        * 参数
            * guid：由32位十六进制字符组成，使用`-`分隔，分隔规则为`8位-4位-4位-4位-12位`，内容使用`"{}"`包裹
            * hidden：是否隐藏在菜单中，false：不隐藏，true：隐藏
            * name：菜单栏中的名称，内容使用`""`包裹
            * tabTitle：标题栏名称，内容使用`""`包裹
            * suppressApplicationTitle：标题名称不被应用程序改变，false：可以被改变，true：不能被改变
            * commandline：当菜单栏中的名称被点击时要执行的`powershell`命令，命令使用`""`包裹 
            * startingDirectory：启动时的目录。如果是在wsl中，则wsl的根目录表示为`//wsl$/WSL_NAME/`。其中`WSL_NAME`表示发行版名称，如`Ubuntu-20.04`，在命令提示符中执行`wsl -l --all`可以查看所有的发行版名称
    1. 配置`defaultProfile`项为`profiles->list`中某项的`guid`作为默认启动项 
* 快捷方式
    * 分屏：`shift + alt + d`
    * 关闭有焦点的窗口：`ctrl + shift + w`
    * 有分屏的情况下调整有焦点的窗口的宽度和高度：`shift + alt + 方向键`
