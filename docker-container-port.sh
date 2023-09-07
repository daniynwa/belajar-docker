"Perintah untuk melakukan port forwading pada container docker"

contoh : docker container create --name namacontainer --publish posthost:portcontainer image:tag
  docker container create --name corpnginx --publish 8080:80 nginx:latest
```bash
[root@corp dani]# docker container ls -a
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS       PORTS      NAMES
3f2ad9791abf   nginx:latest   "/docker-entrypoint.…"   18 seconds ago   Created                 corpnginx
bc0dbb5776b2   redis:latest   "docker-entrypoint.s…"   4 hours ago      Up 4 hours   6379/tcp   credis
[root@corp dani]#
```
