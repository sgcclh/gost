This dockerfile builds an image of [gost-2.4](https://github.com/ginuerzh/gost/releases) based on [debian:oldstable-slim](https://hub.docker.com/_/debian/)
***
#### Quick Start
This image uses ENTRYPOINT to run the containers as an executable.  
`docker run -d -p 8080:8080 sgcclh/gost -L=:8080`
***
#### Create shadowsocks server and client:
* shadowsocks server  
`docker run -d -p 8080:8080 sgcclh/gost -L=ss://aes-128-cfb:password@:8080`
* shadowsocks client  
`docker run -d -p 8080:8080 --net=host sgcclh/gost -L=:8080 -F=ss://aes-128-cfb:password@s_ip:8080`  
then try with cURL:  
`curl -x 127.0.0.1:8080 https://myip.today`
***
#### Deploy in [app.arukas.io](https://app.arukas.io/):
* 8080-TCP|CMD `-L=:8080` 
    * client: chrome+switchyomega HTTPS Endpoint:443
    * gost client: `-L=:8080 -F=socks5://s_ip:s_port`
* 8088-UDP|CMD `-L=http2+kcp://:8088`
    * gost client: -L=:8080 -F=http2+kcp://s_ip:s_port
* 8080-TCP,8088-UDP,8338-tcp|CMD `-L=:8080 -L=http2+kcp://:8088 -L=ss://aes-128-cfb:password@:8338`
    * client: shadowsocks client
    * gost client: `-L=:8080 -F=?`
***
