## CMD 
* chm 转 html 
    * 语法：`hh -decompile TARGET_DIR CHM_FILE`
    * `TARGET_DIR`：转成html的存储文件夹
    * `CHM_FILE`：chm文件
    * 示例：`hh -decompile D:\desktop\jquery jquery_3.2.1.CHM`
* 设置`GPT`磁盘分区的`分区类型GUID`
    1. 使用快捷键`Win+R`,运行`diskpart`命令
    1. 列出磁盘`list disk`
    1. 选择要设置`分区类型GUID`的分区所在的磁盘`select disk 磁盘序号`，如`select disk 0`
    1. 列出分区`list part`
    1. 选择要设置`分区类型GUID`的分区`select part 分区序号`，如`select part 2`
    1. 设置`分区类型GUID`，`set id=分区类型GUID值`，如`set id=DE94BBA4-06D1-4D40-A16A-BFD50179D6AC`