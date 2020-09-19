## wsl
* 安装：在`Microfost Store`中搜索`linux`，安装需要的linux子系统
* 列出已经安装的linux子系统：`wsl -l -v`
* 设置默认启动的linux子系统：`wsl -s NAME`，其中`NAME`为`列出已经安装的linux子系统`命令中列出的发行版名称
* 以指定的用户启动linux子系统：`wsl -u USERNAME`，其中`USERNAME`为linux子系统中的用户名
* 运行指定的linux子系统：`wsl -d NAME [-u USERNAME]`，其中`NAME`为`列出已经安装的linux子系统`命令中列出的发行版名称,`USERNAME`为linux子系统中的用户名
* 设置默认linux子系统登录用户：`NAME --default-user USERNAME`，其中`NAME`为`列出已经安装的linux子系统`命令中列出的发行版名称,`USERNAME`为linux子系统中的用户名
* [升级`WSL1`到`WSL2`](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10#update-to-wsl-2)
    1. 查看已经安装的`WSL`：执行`列出已经安装的linux子系统`命令，并确认要从`WSL1`升级到`WSL2`的子系统，记下发行版名称，假设其为`WSL1_NAME`
        * 在管理员命令提示符中输入命令`wsl --set-version WSL1_NAME 2`并等待执行完成
        * 执行成功：升级已经完成，无须进行后续步骤
        * 执行失败：进行后续步骤
    1. 在命令提示符中输入命令`winver`并执行，在弹出的窗口中确认Win10内部版本号大于等于`18362`
    1. 在`控制面板-系统-系统`中确认操作系统为`64 位操作系统，基于 x64 的处理器`
    1. 在管理员命令提示符中输入命令`dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`并执行完成
    1. 重启计算机
    1. 在管理员命令提示符中输入命令`wsl --set-default-version 2`并执行
        * 若执行失败则[下载升级文件](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)(此文件已经下载到`数据仓储`中，亦可直接使用)并安装，然后再重新执行当前步骤命令
    1. 回到第一步
* 常见问题
    * 在`WSL1`版本中`Ubuntu-20.04`的`sleep`模块异常，升级`WSL1`到`WSL2`即可解决