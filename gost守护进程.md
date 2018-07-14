vi /etc/init.d/gost
chmod +x /etc/init.d/gost
chkconfig --add gost
chkconfig --list gost
cat /etc/rc.d/init.d/gost
```
#!/bin/bash
# chkconfig: 3 88 88
/usr/bin/gost -L=socks5://zjdl:zpepc001@:1080& >/dev/null 2>/dev/null
```
```
#!/bin/bash
# chkconfig: 3 88 88
/usr/bin/gost -L rtcp://:10022/172.19.167.73:22 -L rtcp://:4443/172.19.167.73:4443 -F socks5://zjdl:zpepc001@k8s.lqdl.net:1080?mbind=true & >/dev/null 3>/dev/null
```
