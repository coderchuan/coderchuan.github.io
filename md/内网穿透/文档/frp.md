## frp 
* 配置
    * 服务端
        * `[common]`
            * 基础配置
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
                        * `./frps.log`,默认
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
            * http和htts配置
                * `vhost_http_port`
                    * 功能：为 HTTP 类型监听的端口 
                    * 类型：int 
                    * 取值
                        * 0,关闭
                        * 80,在80端口监听http请求
                        * 其他值,在指定的端口监听http请求
                * `vhost_https_port`
                    * 功能：为 HTTPS 类型监听的端口 
                    * 类型：int 
                    * 取值
                        * 0,关闭
                        * 80,在80端口监听https请求
                        * 其他值,在指定的端口监听https请求 
                * `vhost_http_timeout`
                    * 功能：HTTP 请求的超时秒数
                    * 类型：int 
                    * 取值
                        * 60,超过60秒则认为当前页面无回应,默认
                        * 其他值,超过指定的秒数则认为当前页面无回应,默认
                * `custom_404_page`
                    * 功能：自定义 404 错误页面地址
                    * 类型：text 
                    * 取值
                        * 未设置,使用系统默认的错误页面
                        * 自定义的URL 
            * 权限配置 
                * `authentication_method`
                    * 功能：鉴权方式,服务端与客户端面需要保持一致
                    * 类型：text 
                    * 取值 
                        * token,默认
                        * oidc 
                * `authenticate_heartbeats`
                    * 功能：开启心跳消息鉴权,服务端与客户端面需要保持一致
                    * 类型：bool 
                    * 取值：false,默认  
                * `authenticate_new_work_conns`
                    * 功能：开启建立连接时的鉴权,服务端与客户端面需要保持一致
                    * 类型：bool
                    * 取值：false,默认 
                * `token`
                    * 功能：token鉴权方式的token值,服务端与客户端面需要保持一致
                    * 类型：string 
                    * 取值：客户端需要设置一样的值才能鉴权通过 
            * 并发控制
                * `allow_ports`
                    * 功能：允许代理的服务端端口
                    * 类型：text 
                    * 取值：每个值之间用逗号分隔,每个值可取以下格式
                        * int,如8080
                        * 连接符,如1000-2000
                * `max_pool_count`
                    * 功能：最大的连接池大小
                    * 类型：int 
                    * 取值：5,默认
                * `max_ports_per_client`
                    * 功能：单个客户端同时连接的数量
                    * 类型：int
                    * 取值
                        * 0,无限制,默认 
                        * 5,限制为5 
                        * 其他值,限制为指定的值
                * `tls_only`
                    * 功能：只接受启用了 TLS 的客户端连接
                    * 类型：bool 
                    * 取值：false,默认
            * 监控面板配置
                * `dashboard_addr`
                    * 功能：服务端监控面板地址
                    * 类型：text 
                    * 取值：同`bind_addr`
                * `dashboard_port`
                    * 功能：监控面板端口
                    * 类型：int 
                    * 取值
                        * 0,关闭监控面板,默认
                        * 5114,在5114端口可访问监控面板
                        * 其他值,在指定的端口访问监控面板
                * `dashboard_user`
                    * 功能：监控面板登录用户名
                    * 类型：text 
                    * 取值：admin,默认
                * `dashboard_pwd`
                    * 功能：监控面板登录密码
                    * 类型：text 
                    * 取值：admin,默认 
    * 客户端 
        * `[common]`
            * 基础配置 
                * `server_addr`
                    * 功能：frp服务端通讯的公网ip或域名，用于和服务端通讯
                    * 类型：text
                    * 取值
                        * 0.0.0.0,默认值。此时表示无服务端
                        * 其他ip地址,将指定的ip地址作为服务端
                * `server_port`
                    * 功能：frp服务端端口(保持与服务端通讯) 
                    * 类型：int
                    * 取值
                        * 7000,默认值
                        * 其他值,使用指定的端口
                * `http_proxy`
                    * 功能：连接服务端使用的代理地址。当本机无法直接连接到服务端时,使用代理连接
                    * 类型：text
                    * 取值
                        * 格式为`{protocol}://user:passwd@host:port`
                            * `protocol`:代理协议,可取`http`,`socks5`
                            * `user`:用户名
                            * `passwd`:密码
                            * `host`:代理主机的IP或域名
                            * `port`:代理主机的端口
                        * 未设置此项,不使用代理地址,其他符合指定的格式的值,使用此代理连接到服务端 
                * `log_file`
                    * 功能：日志文件地址
                    * 类型：text
                    * 取值
                        * `./frpc.log`,默认日志文件
                        * `console`,标准输出
                * `log_level`:同服务端`log_level`
                * `log_max_days`:同服务端`log_max_days`
                * `disable_log_color`:同服务端`disable_log_color`
                * `pool_count`
                    * 功能：连接池大小
                    * 类型：int
                    * 取值
                        * 0,无限制
                        * 其他值,限制指定的数值
                * `user`
                    * 功能：在代理配置名称前加`{user}.`,例如代理名称为`[ssh]`,设置此值后,名称为`{user}.ssh`
                    * 类型：text
                    * 取值
                        * 未设置此项时,代理配置名称前加前缀
                        * 其他值,在代理配置名称前加指定的前缀 
                * `dns_server`
                    * 功能：frp客户端使用的`DNS`服务器IP
                    * 类型：text 
                    * 取值：未设置此项时默认使用系统的`dns`地址 
                * `login_fail_exit`
                    * 功能：启动时连接到服务器失败后是否退出
                    * 类型：bool
                    * 取值 
                        * true,连接到服务器失败后直接退出程序,默认
                        * false,连接到服务器失败后不退出程序,尝试重新连接
                * `protocol`
                    * 功能：与服务端通讯的通讯协议
                    * 类型：text
                    * 取值
                        * tcp,默认 
                        * websocket 
                        * kcp
                * `tls_enable`
                    * 功能：是否启用 TLS 协议加密连接
                    * 类型：bool
                    * 取值
                        * false,默认
                        * true,启用TLS加密
                * `heartbeat_interval`
                    * 功能：向服务端发送心跳包的间隔秒数
                    * 类型：int 
                    * 取值
                        * 30,默认 
                        * 其他值,指定的秒数 
                * `heartbeat_timeout`
                    * 功能：服务端回复心跳包的超时秒数 
                    * 类型：int 
                    * 取值
                        * 90,默认 
                        * 其他值,指定的秒数 
                * `start`
                    * 功能：只启用指定的代理配置
                    * 类型：text 
                    * 取值
                        * 未配置此项时,默认启用全部的代理配置 
                        * 每个代理配置名称使用逗号`,`隔开 
            * 权限配置 
                * `authentication_method`:同服务端`authentication_method`
                * `authenticate_heartbeats`:同服务端`authentication_method`
                * `authenticate_new_work_conns`:同服务端`authenticate_new_work_conns`
                * `token`:同服务端`token`
            * 监控面板配置
                * `admin_addr`
                    * 功能：客户端监控面板本地地址 
                    * 类型：text 
                    * 取值
                        * 0.0.0.0,默认,本机所有的网卡地址
                        * 其他ip,指定的网卡ip 
                * `admin_port`
                    * 功能：客户端监控面板本地地址端口 
                    * 类型：int
                    * 取值
                        * 0,默认,关闭客户端监控面板
                        * 其他值,指定的端口
                * `admin_user`
                    * 功能：用户名
                    * 类型：text 
                    * 取值 
                        * admin,默认
                        * 其他值,指定的用户名 
                * `admin_pwd`
                    * 功能：密码
                    * 类型：text 
                    * 取值 
                        * admin,默认
                        * 其他值,指定的密码 
        * `[proxy_config]`代理配置。名称可自定义,如`[ssh]`,`[web]`,可定义多个代理配置 
            * 基础配置 
                * 
* 开启kcp模式(当frp客户端网络状况不佳时建议使用此模式) 
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
