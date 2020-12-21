## frp 
* 配置
    * 服务端
        * `bind_addr`
            * 功能：与frp客户端通讯
            * 类型：text
            * 取值：服务网卡的地址IP地址
                * `0.0.0.0`:监听所有服务器网卡的IPv4地址。默认值
                * `[::]:`监听所有服务器网卡的IPv6地址 
                * `其他ip值`:监听指定的服务器网卡地址 
        * `bind_port`
            * 功能：与frp客户端通讯的TCP端口
            * 类型：int
            * 取值:7000,默认 
        * `bind_udp_port`
            * 功能：与frp客户端通讯的UDP端口(辅助创建P2P连接实现xtcp模式) 
            * 类型：int
            * 取值
                * 0:关闭
                * 其他值:开启
        * `kcp_bind_port`
            * 功能：与frp客户端通讯的KCP(基于upd实现)端口  
            * 类型：int 
            * 取值
                * 0:关闭
                * 其他值:开启
        * `proxy_bind_addr`
            * 功能：外网访问的地址
            * 类型：text
            * 取值：同`bind_addr`
        * `log_file`
            * 功能：记录日志
            * 类型：text
            * 取值
                * 文件路径,日志保存路径
                * console,日志输出到标准输出
        * `log_level`
            * 功能：日志等级
            * 类型：text 
            * 取值,以下值依次宽松
                * trace
                * debug
                * info,默认
                * warn
                * error
        * `log_max_days`
            * 功能：日志保存时间(天) 
            * 类型：int      
            * 取值：3,默认
        * `disable_log_color`  
            * 功能：禁用标准日志中的颜色 
            * 类型：bool 
            * 取值：false,默认
        * `detailed_errors_to_client`
            * 功能：服务端返回详细的日志给客户端
            * 类型：bool
            * 取值：true,默认
        * `heart_beat_timeout`
            * 功能：服务端和客户端心跳连接的超时时间(秒) 
            * 类型：int
            * 取值：90,默认 
        * `user_conn_timeout`
            * 功能：用户建立连接后等待客户端响应的超时时间(秒)
            * 类型：int
            * 取值：10,默认  
        * `authentication_method`
            * 功能：鉴权方式
            * 类型：text 
            * 取值 
                * token,默认
                * oidc 
        * `authenticate_heartbeats`
            * 功能：开启心跳消息鉴权 
            * 类型：bool 
            * 取值：false,默认  
        * `authenticate_new_work_conns`
            * 功能：开启建立连接时的鉴权 
            * 类型：bool
            * 取值：false,默认 
        * `token`
            * 功能：token鉴权方式的token值 
            * 类型：string 
            * 取值：客户端需要设置一样的值才能鉴权通过 
    * 客户端 

* 开启kcp模式(当网络状况不佳时建议使用此模式) 
    * 服务端添加以下选项
        ```
        [common]
        kcp_bind_port 
        ```
    * 客户端添加以下选项 
        ```
        [common]
        protocol = kcp
        ```
* 穿透类型及配置项
    * tcp、udp
        * 服务端 
            ```
            [common]
            bind_port
            ```
        * 客户端
            ```
            [common]
            server_addr 
            server_port 

            [tcp_or_udp]
            type 
            local_ip 
            local_port 
            remote_port 
            ```
    * http
        * 服务端
            ```
            [common]
            bind_port 

            [http]
            vhost_http_port 
            ```
        * 客户端
            ```
            [common]
            server_addr 
            server_port 

            [http]
            type 
            local_port 
            custom_domains 
            subdomain
            locations 
            ```
    * https
        * 服务端
            ```
            [common]
            bind_port 

            [https]
            vhost_https_port  
            ```
        * 客户端
            ```
            [common]
            server_addr 
            server_port

            [https]
            type 
            custom_domains 
            plugin 
            plugin_local_addr 
            plugin_crt_path 
            plugin_key_path  
            plugin_host_header_rewrite  
            plugin_header_X-From-Where 
            ```
    * stcp(加密的tcp传输)、sudp(加密的udp传输)
        * 服务端
            ```
            [common]
            bind_port 
            ```
        * 客户端
            ```
            [common]
            server_addr 
            server_port 

            [stcp_or_sudp]
            type 
            sk 
            local_ip 
            local_port 
            ```
        * 访问端 
            ```
            [common]
            server_addr 
            server_port 

            [stcp_or_sudp_or_xtcp]
            type 
            role 
            server_name 
            sk 
            bind_addr 
            bind_port 
            ```
    * xtcp
        * 服务端
            ```
            [common]
            bind_port 
            bind_udp_port 
            ```
        * 客户端
            ```
            [common]
            server_addr 
            server_port 

            [xtcp]
            type 
            sk 
            local_ip 
            local_port 
            ```
        * 访问端 
            ```
            [common]
            server_addr 
            server_port 

            [stcp_or_sudp_or_xtcp]
            type 
            role 
            server_name 
            sk 
            bind_addr 
            bind_port 
            ```
