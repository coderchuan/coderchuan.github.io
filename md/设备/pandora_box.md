## 无线中继
1. 默认网关`192.168.1.1`,默认用户名`root`,默认密码`admin`
1. 点击`网络-无线-搜索`
1. 找到要中继的无线网络(列表中未出现需要中继的wifi名称时,可点击右下角的`重新扫描`刷新列表),点击`加入网络`
1. 输入需要中继的无疑网络密码,防火墙区域选择`wan`,点击提交
1. 接口配置右下角点击`保存&应用`
1. 等候五分钟或重启路由器即可中继成功,成功的标志是:在`网络-接口-WWAN`的"网络栏"下有被中继的无线网络名称且"状态"栏中已经被分配了IP地址 
1. 中继成功后连接`网络-无线-无线概况`中模式为`master`的WIFI即可使用被中继的无线网络
    1. 修改`master`的无线网络名称:修改`修改-接口配置-基本配置-ESSID`
    1. 修改`master`的无线网络密码:修改`修改-接口配置-无线安全-密码`
    1. 点击右下角的`保存&应用`
    1. 等候五分钟或重启路由器即可修改成功