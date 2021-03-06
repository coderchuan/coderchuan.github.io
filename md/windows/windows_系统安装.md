# windows系统安装(UEFI) 

## 准备工具 
* 一个正常运行的windows10系统或一个win10PE系统，以下称为`工具系统`
    * 此系统要求可运行在可移动硬盘中，以下称为`工具硬盘`
* 可移动硬盘中应包含以下软件 
    * windows10系统镜像
    * diskgenius绿色版软件 
    * dism++
    * xorboot_0.25
    * bootice
* 硬盘。以下称为`目标硬盘`。可任选其一
    * 实体硬盘
    * 虚拟硬盘`VHD、VHDX`
        * 创建，有以下三种，可任选其一
            * 使用`diskpart`命令行工具，在`diskpart`命令行工具中执行`help create vdisk`以获取帮助
            * 使用`磁盘管理`-`点击空白区域以未选中任何磁盘`-`操作`-`创建VHD`
            * 使用`BOOTICE.EXE`-`磁盘镜像`-`创建VHD`
        * 挂载(挂载成功的标志是磁盘管理中有创建好的虚拟硬盘)。挂载方式有以下三种，可任选其一
            * 找到`虚拟硬盘VHD、VHDX`文件双击即可挂载
            * 使用`磁盘管理`-`点击空白区域以未选中任何磁盘`-`操作`-`附加VHD`
            * 使用`BOOTICE.EXE`-`磁盘镜像`-`挂载/卸载VHD`

## 安装步骤
1. 在将要安装系统的计算机中运行`工具系统`
1. 将目标硬盘转换为`gpt`分区格式。如果硬盘已经是`gpt`分区格式可跳过此步骤
    * 查看是否是`gpt`分区格式
        1. `田+R`输入`diskpart`,打开命令行工具
        1. 在命令行工具中执行命令`list disk`
        1. 根据输出信息和磁盘容量判断`目标硬盘`是哪个硬盘，如果输出信息中的`Gpt`字段是`*`则表明是`gpt`分区格式
    * 将非`gpt`分区格式的硬盘转换为`gpt`分区格式
        * 使用`diskpart`命令行工具(将会清空磁盘，注意备份数据)
            1. `list disk`，记下目标磁盘编号`N`
            1. `select disk N`，其中`N`为目标磁盘编号
            1. `clean`。此命令将磁盘清空为无分区格式的状态
            1. `convert gpt`。此命令将磁盘初始化为`gpt`分区格式
            1. `select part 1`，如果出现提示信息`分区 1 现在是所选分区`则继续执行`delete part override`
            1. `exit`
        * 使用`diskgenius`无损转换
            1. 在左侧栏选择`目标磁盘`
            1. 在菜单栏选择`硬盘`
            1. 选择`转换分区表类型为GUID格式`
            1. 点击左上角`保存更改`，并确定保存
1. 将硬盘清理出空闲空间(建议连续的空闲空间大于等于`30GB`)，如果已经有空闲空间，则可跳过此步骤
    1. 运行`diskgenius`
    1. 在左侧栏选择`目标磁盘`，顶部选中将要置于为`空闲`的分区
    1. 右击选择`删除当前分区`，并确定删除
    1. 点击左上角`保存更改`，并确定保存
1. 在`未分配空间`中创建`EFI`分区，建议大小为`100MB~1024MB`。已经存在`efi`分区则可跳过此步骤
    * 使用`diskpart`命令行工具创建
        1. `list disk`，记下目标磁盘编号`N`
        1. `select disk N`，其中`N`为目标磁盘编号
        1. `create part efi size=1024`，其中`1024`为磁盘大小，单位为`MB`，可自定义大小
        1. `format fs=fat32 quick override`
        1. `assign letter=L`。其中`L`为分配的盘符，可自选，但不能选择已经使用的盘符
        1. `exit`
    * 使用`diskgenius`创建
        1. 左侧栏选中`目标磁盘`，顶部选中将要创建`efi`分区的`空闲`分区
        1. 在`空闲`分区上右击选择`建立新分区`，如果弹出了标题为`建立ESP/MSR分区`的窗口，则点击取消
        1. 在标题为`建立新分区`的窗口中选择文件系统类型`EFI system partition`分区大小自已定义，点击确定
        1. 点击左上角`保存更改`，并确定保存
        1. 立即格式化选择`是`
1. 在`未分配空间`中创建`NTFS`分区。如果已经有可用的空`NTFS`分区则可跳过此步骤
    * 使用`diskpart`命令行工具创建
        1. `list disk`，记下目标磁盘编号`N`
        1. `select disk N`，其中`N`为目标磁盘编号
        1. `create part primary`或`create part primary size=29696`，其中`29696`为磁盘大小，单位为`MB`，可自定义大小
        1. `format fs=ntfs quick override`
        1. `assign letter=K`。其中`K`为分配的盘符，可自选，但不能选择已经使用的盘符
        1. `exit`
    * 使用`diskgenius`创建
        1. 左侧栏选中`目标磁盘`，顶部选中将要创建`NTFS`分区的`空闲`分区
        1. 在`空闲`分区上右击选择`建立新分区`，如果弹出了标题为`建立ESP/MSR分区`的窗口，则点击取消
        1. 在标题为`建立新分区`的窗口中选择文件系统类型`NTFS`分区大小自已定义，点击确定
        1. 点击左上角`保存更改`，并确定保存
        1. 立即格式化选择`是`
1. 安装系统
    1. 打开`dism++`
    1. 选择菜单`文件`
    1. 选择菜单`释放映像`
    1. `映像文件路径`选择准备好的windows10系统镜像
    1. `安装路径`选择`K`，其中`K`是创建的`NTFS`分区分配的盘符 
    1. `目标映像`选择合适的目标映像
    1. 勾选`Compact`、`添加引导`、`格式化`，点击确定
    1. 弹出的`修复引导`窗口中选择`更多`
    1. 选择之前创建的`efi`分区，并点击确定
    1. 等待完成安装
1. 制作多引导工具，参见[xorboot引导工具](index.html?title=/md/xorboot)。如无此需求可跳过此步骤。
1. 拔出`工具硬盘`，重启计算机即可进入正常安装流程
