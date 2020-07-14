## wsl
* 安装：在`Microfost Store`中搜索`linux`，安装需要的linux子系统
* 列出已经安装的linux子系统：`wsl -l`
* 设置默认启动的linux子系统：`wsl -s NAME`，其中`NAME`为`wsl -l`中列出的发行版名称
* 以指定的用户启动linux子系统：`wsl -u USERNAME`，其中`USERNAME`为linux子系统中的用户名
* 运行指定的linux子系统：`wsl -d NAME [-u USERNAME]`，其中`NAME`为`wsl -l`中列出的发行版名称,`USERNAME`为linux子系统中的用户名
* 设置默认linux子系统登录用户：`NAME --default-user USERNAME`，其中`NAME`为`wsl -l`中列出的发行版名称,`USERNAME`为linux子系统中的用户名
