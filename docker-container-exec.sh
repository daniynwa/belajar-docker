"Perintah untuk mengeksekusi program bash script yang terdapat didalam container dengan bantuan container exec"

Contoh : docker container exec -i -t containerid/namacontainer /bin/bash

-i adalah argument interaktif, untuk menjaga input tetap aktif
-t adalah argument alokasi pseudo-TTY (terminal akses)
-bin/bash adalah contoh kode program yang terdapat didalam container
```bash
[root@corp ~]# docker container exec -i -t credis /bin/bash
root@bc0dbb5776b2:/data# ls
root@bc0dbb5776b2:/data# ls /
bin  boot  data  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@bc0dbb5776b2:/data# redis-cli
127.0.0.1:6379>
127.0.0.1:6379> set DAY "Dani Afriyadi Yusuf"
OK
127.0.0.1:6379> get DAY
"Dani Afriyadi Yusuf"
127.0.0.1:6379>exit
root@bc0dbb5776b2:/data#exit
[root@corp ~]#
```
