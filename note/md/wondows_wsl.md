## wsl
* 安装：在`Microfost Store`中搜索`linux`，安装需要的linux子系统
* 列出已经安装的linux子系统：`wsl -l -v`
* 设置默认启动的linux子系统：`wsl -s NAME`，其中`NAME`为`列出已经安装的linux子系统`命令中列出的发行版名称
* 以指定的用户启动linux子系统：`wsl -u USERNAME`，其中`USERNAME`为linux子系统中的用户名
* 运行指定的linux子系统：`wsl -d NAME [-u USERNAME]`，其中`NAME`为`列出已经安装的linux子系统`命令中列出的发行版名称,`USERNAME`为linux子系统中的用户名
* 设置默认linux子系统登录用户：`NAME --default-user USERNAME`，其中`NAME`为`列出已经安装的linux子系统`命令中列出的发行版名称,`USERNAME`为linux子系统中的用户名
* [升级`WSL1`到`WSL2`](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10#update-to-wsl-2)
* 常见问题
    * 在`WSL1`版本中`Ubuntu-20.04`的`sleep`模块异常，升级`WSL1`到`WSL2`即可解决