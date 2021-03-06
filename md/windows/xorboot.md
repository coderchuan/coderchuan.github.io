## xorboot 
* 启动要求
    * 计算机主板关闭安全启动 
    * 启动分区所在磁盘分区表格式为：GPT
    * 启动分区为标准的EFI分区格式 
        * 分区GUID：参见[GPT EFI分区类型GUID](index.html?title=/md/gpt分区)
        * 卷格式：fat32/fat16
    * xorboot版本：0.2.5 2019.04.13
* 工作文件(夹)
    * 引导程序
        * 文件位置：`启动分区\EFI\BOOT\BOOTX64.EFI`
        * 生成方式：由`xorboot.ext`-`UEFI启动管理`-`导出XorBoot.efi`-`BootX64.efi`导出 
        * 功能：读取`启动分区\EFI\XORBOOT\XORBOOT.XOR`
    * 菜单文件
        * 文件位置：`启动分区\EFI\XORBOOT\XORBOOT.XOR`。子菜单可以存储在`启动分区`任意位置，可自由命名
        * 生成方式：通过打开或新建，并编辑菜单，保存即可生成
        * 功能：作为启动菜单呈现。可自定义背景图片和高亮图片，可使用的格式有：png、bmp、gif、jpg、wmf
* 文件定位方式`(文件位置)`
    * 文件位于任意磁盘上。自动搜索磁盘、分区、文件，定位到第一个符合条件的文件
    * 文件位于指定磁盘上。在指定的磁盘上自动搜索分区、文件，定位到第一个符合条件的文件
    * 文件位于指定磁盘的指定分区上(推荐)。在指定的磁盘指定的分区上搜索文件，直接定位到符合条件的文件
    * 文件位于启动设备上。在当前启动菜单文件(`xorboot.xor`)所在磁盘和分区上搜索文件，直接定位到符合条件的文件
* 启动类型
    * EFI应用程序
        * 要求：`EFI应用程序`所在分区必须为`启动分区`
        * 配置选项
            * 磁盘：若可选择则选择`EFI应用程序`所在磁盘
            * 分区：若可选择则选择`EFI应用程序`所在分区
            * 文件名：`EFI应用程序`位置，通过浏览选择
    * Windows NT 6+
        * 配置选项
            * 磁盘：若可选择则选择`系统`所在磁盘
            * 分区：若可选择则选择`系统`所在分区 
            * `覆写[ESP]\EFI\Microsoft\Boot\BCD`必选
    * Windows NT 6+ VHD
        * 配置选项
            * 磁盘：若可选择则选择`虚拟硬盘文件`所在磁盘 
            * 分区：若可选择则选择`虚拟硬盘文件`所在分区 
            * 文件名：`虚拟硬盘文件`位置，通过浏览选择 
            * 勾选`覆写[ESP]\EFI\Microsoft\Boot\BCD`
    * Windows NT 6+ WIM 
        * 要求
            1. 计算机运行内存大于等于`WIM镜像文件`大小的3倍 
            1. `WIM镜像文件`中含有配置正确的`Windows操作系统的文件结构`。一般用于`Windows的WIM镜像`
        * 配置选项
            * 磁盘：若可选择则选择`WIM镜像文件`所在磁盘 
            * 分区：若可选择则选择`WIM镜像文件`所在分区 
            * 文件名：`WIM镜像文件`位置，通过浏览选择 
    * ISO 镜像文件
        * 要求
            1. 计算机运行内存大于等于`ISO镜像文件`大小的5倍 
            1. `ISO镜像文件`中含有配置正确的`EFI`启动条件
        * 配置选项
            * 磁盘：若可选择则选择`ISO镜像文件`所在磁盘 
            * 分区：若可选择则选择`ISO镜像文件`所在分区 
            * 文件名：`ISO镜像文件`位置，通过浏览选择 
    * Linux ISO
        * 要求
            1. 计算机运行内存大于等于`ISO镜像文件`大小 
            1. `ISO镜像文件`的路径中不能含有中文字符 
        * 配置选项
            * 磁盘：若可选择则选择`ISO镜像文件`所在磁盘 
            * 分区：若可选择则选择`ISO镜像文件`所在分区 
            * 文件名：`ISO镜像文件`位置，通过浏览选择 
            * kernel文件
                * 含义：linux内核文件
                * 填写依据：`ISO镜像文件`中的`内核文件`的路径(路径分割符为`/`) 
                * 示例：`/casper/vmlinuz`
            * 命令行
                * 含义：grub2启动命令
                * 填写依据
                    * 可选命令
                        * `boot`表示当启动位于光盘的Linux系统时，使用把此项值挂载为`/boot`目录，须使用`=`指定值。 
                        * `iso-scan/filename`表示`ISO镜像文件`的位置。须使用`=`指定值，固定使用`${isofile}`作为值
                        * `locale`表示语言与区域设置，须使用`=`指定值，它可取以下值 
                            * `zh_CN.UTF-8`：简体中文,字符编码为`UTF-8`
                            * `zh_TW.UTF-8`：中国台湾繁体中文,字符编码为`UTF-8`
                            * `en_US.UTF-8`：美式英语(默认),字符编码为`UTF-8`
                        * `quiet`表示静默启动，画面尽可能少地显示命令
                        * `splash`表示使用欢迎画面代替启动过程的命令显示
                    * 以上命令需要按`从上到下`的顺利排列，每个命令用空格隔开 
                * 注意：`Xorboot`中的自动填写命令行中的`iso-can/filename`应改写为`iso-scan/filename`
                * 示例：`boot=casper iso-scan/filename=${isofile} locale=zh_CN.UTF-8 quiet splash`
            * Initrd文件：
                * 含义：linux根文件系统结构镜像
                * 填写依据：`ISO镜像文件`中的`linux根文件系统结构镜像`文件的路径(路径分割符为`/`)  
                * 示例：`/casper/initrd`
    * Linux 内核(vmlinuz)
        * 配置选项(可由`diskgenius`查看所在磁盘、分区、内核位置)
            * 磁盘：若可选择则选择`linux内核`所在磁盘 
            * 分区：若可选择则选择`linux内核`所在分区 
            * 文件名
                * 要求
                    1. `linux内核`路径，只能手动填写(文件夹分隔符为`/`)
                    1. 该文件不能是符号链接
                * 示例：`/boot/vmlinuz-5.4.0-42-generic`
        * 勾选`将启动文件所在的分区作为root分区`
        * 命令行
            * 含义：grub2启动命令
            * 填写依据
                * 可选命令
                    * `locale`表示语言与区域设置，须使用`=`指定值，它可取以下值 
                        * `zh_CN.UTF-8`：简体中文,字符编码为`UTF-8`
                        * `zh_TW.UTF-8`：中国台湾繁体中文,字符编码为`UTF-8`
                        * `en_US.UTF-8`：美式英语(默认),字符编码为`UTF-8`
                    * `quiet`表示静默启动，画面尽可能少地显示命令
                    * `splash`表示使用欢迎画面代替启动过程的命令显示
                * 以上命令需要按`从上到下`的顺利排列，每个命令用空格隔开 
            * 示例：`quiet splash`
        * Initrd文件
            * 要求：
                1. linux系统中`linux根文件系统结构镜像`文件的路径(路径分割符为`/`)  
                1. 该文件不能是符号链接
            * 示例：`/boot/initrd.img-5.4.0-42-generic`
    * XorBoot 子菜单
        * 要求：`XOR菜单文件`存储在`启动分区`
        * 配置选项
            * 磁盘：若可选择则选择`XOR菜单文件`所在磁盘 
            * 分区：若可选择则选择`XOR菜单文件`所在分区
            * 文件名：`XOR菜单文件`位置，通过浏览选择
    * Uefi Shell(内置) 
    * 关机
    * 重启计算机
    * 从下一设备启动
