## frp 
* 配置
    * 服务端
        * `bind_addr`
            * 功能：与frp客户端通讯,外网访问地址 
            * 类型：text
            * 取值：服务网卡的地址IP地址
                * `0.0.0.0`:监听所有服务器网卡的IPv4地址。默认值
                * `[::]:`监听所有服务器网卡的IPv6地址 
                * `其他ip值`:监听指定的服务器网卡地址 
        * `bind_port`
            * 功能：与frp客户端通讯的端口,用于实现tcp、udp模式的内网穿透
            * 类型：int或rang 
            * 取值
                * 7000。默认值
                * 
        * `kcp_bind_port`
            * 功能：与frp客户端通讯的端口,用于实现kcp模式的内网穿透 
            * 类型：int 
            * 取值
                * 0:关闭
                * 其他值:开启
        * `bind_udp_port`
            * 功能：与frp客户端通讯的端口,用于辅助创建P2P连接实现xtcp模式的内网穿透
            * 类型：int
            * 取值
                * 0:关闭
                * 其他值:开启
    * 客户端 
 


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
    * stcp(加密的tcp传输)、sudp(加密的udp传输)、xtcp(点对点的tcp传输) 
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
