"Cara untuk melakukan backup volume pada docker container"

contoh : docker volume create "namavolume"
  docker volume create mongovolume
contoh : docker container create --name namacontainer --publish 27018:27017 --mount "type=value,source=directory-source,destination=folder-directory-container" --env KEY="value" image:tag
  docker container create --name daymongodb --publish 27018:27017 --mount "type=volume,source=mongovolume,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=root --env MONGO_INITDB_ROOT_PASSWORD=mongo12345 mongo:latest

"Disini kita akan melakukan backup volume mongovolume yang digunakan container daymongodb /data/db"
contoh : 
  docker container create --name nginxbackup --mount "type=bind,source=/home/dani/backup-volume,destination=/backup" --mount "type=volume,source=mongovolume,destination=/data" nginx:latest

  docker container start nginxbackup /'Melakukan start container yang akan melakukan backup'

  docker container exec -i -t nginxbackup /bin/bash /'masuk kedalam container nginxbackup'

```bash
root@72a3f853cbec:/data# ls -l
total 312
-rw-------. 1 999 999    50 Sep  8 06:58 WiredTiger
-rw-------. 1 999 999    21 Sep  8 06:58 WiredTiger.lock
-rw-------. 1 999 999  1463 Sep  8 06:58 WiredTiger.turtle
-rw-------. 1 999 999 53248 Sep  8 06:58 WiredTiger.wt
-rw-------. 1 999 999  4096 Sep  8 06:58 WiredTigerHS.wt
-rw-------. 1 999 999 20480 Sep  8 06:58 _mdb_catalog.wt
-rw-------. 1 999 999 20480 Sep  8 06:58 collection-0-4216942743969268707.wt
-rw-------. 1 999 999 36864 Sep  8 06:58 collection-2-4216942743969268707.wt
-rw-------. 1 999 999  4096 Sep  8 06:58 collection-4-4216942743969268707.wt
-rw-------. 1 999 999 20480 Sep  8 06:58 collection-7-4216942743969268707.wt
drwx------. 2 999 999    90 Sep  8 06:58 diagnostic.data
-rw-------. 1 999 999 20480 Sep  8 06:58 index-1-4216942743969268707.wt
-rw-------. 1 999 999 36864 Sep  8 06:58 index-3-4216942743969268707.wt
-rw-------. 1 999 999  4096 Sep  8 06:58 index-5-4216942743969268707.wt
-rw-------. 1 999 999  4096 Sep  8 06:58 index-6-4216942743969268707.wt
-rw-------. 1 999 999 20480 Sep  8 06:58 index-8-4216942743969268707.wt
-rw-------. 1 999 999 20480 Sep  8 06:58 index-9-4216942743969268707.wt
drwx------. 2 999 999   110 Sep  8 06:58 journal
-rw-------. 1 999 999     0 Sep  8 06:58 mongod.lock
-rw-------. 1 999 999 36864 Sep  8 06:58 sizeStorer.wt
-rw-------. 1 999 999   114 Sep  8 06:58 storage.bson
root@72a3f853cbec:/data#
```
"Setelah masuk kita akan melakukan archive folder /data di dalam container ke folder /backup didalam container nginxbackup"

tar cvf /backup/mongovolume.tar.gz /data

```bash
root@72a3f853cbec:/# cd /backup/
root@72a3f853cbec:/backup# ls -l
total 0
root@72a3f853cbec:/backup# tar cvf /backup/mongovolume.tar.gz /data
tar: Removing leading `/' from member names
/data/
/data/mongod.lock
/data/journal/
/data/journal/WiredTigerLog.0000000002
/data/journal/WiredTigerPreplog.0000000001
/data/journal/WiredTigerPreplog.0000000002
/data/WiredTiger.lock
/data/WiredTiger
/data/WiredTiger.wt
/data/WiredTiger.turtle
/data/WiredTigerHS.wt
/data/sizeStorer.wt
/data/_mdb_catalog.wt
/data/storage.bson
/data/collection-0-4216942743969268707.wt
/data/index-1-4216942743969268707.wt
/data/collection-2-4216942743969268707.wt
/data/index-3-4216942743969268707.wt
/data/collection-4-4216942743969268707.wt
/data/index-5-4216942743969268707.wt
/data/index-6-4216942743969268707.wt
/data/diagnostic.data/
/data/diagnostic.data/metrics.2023-09-08T06-58-11Z-00000
/data/diagnostic.data/metrics.2023-09-08T06-58-15Z-00000
/data/.mongodb/
/data/.mongodb/mongosh/
/data/.mongodb/mongosh/64fac6030e246bb71b22db38_log
/data/.mongodb/mongosh/config
/data/.mongodb/mongosh/mongosh_repl_history
/data/.mongodb/mongosh/64fac603e4e3ff4b98bcbe45_log
/data/.mongodb/mongosh/snippets/
/data/.mongodb/mongosh/snippets/package.json
/data/.mongodb/mongosh/am-64fac6030e246bb71b22db37.json
/data/collection-7-4216942743969268707.wt
/data/index-8-4216942743969268707.wt
/data/index-9-4216942743969268707.wt
root@72a3f853cbec:/backup# ls -l
total 307580
-rw-r--r--. 1 root root 314961920 Sep  8 07:27 mongovolume.tar.gz
'
```

"Kemudian cek data yang di backup kedalam sstem host"

```bash
root@72a3f853cbec:/# exit
exit
[root@corp dani]# ls -l
total 8
drwxr-xr-x. 2 root             root   32 Sep  8 14:27 backup-volume
drwxr-xr-x. 2 dani             dani    6 Sep  4 17:30 Desktop
-rw-r--r--. 1 root             root  120 Sep  5 10:12 docker-compose.yml
drwxr-xr-x. 2 dani             dani    6 Sep  4 17:30 Documents
drwxr-xr-x. 2 dani             dani   66 Sep  5 11:02 Downloads
drwxr-xr-x. 5 systemd-coredump root 4096 Sep  8 13:43 mongo-data
drwxr-xr-x. 2 dani             dani    6 Sep  4 17:30 Music
drwxr-xr-x. 2 dani             dani    6 Sep  4 17:30 Pictures
drwxr-xr-x. 2 dani             dani    6 Sep  4 17:30 Public
drwxr-xr-x. 2 dani             dani    6 Sep  4 17:30 Templates
drwxr-xr-x. 2 dani             dani    6 Sep  4 17:30 Videos
[root@corp dani]# cd backup-volume/
[root@corp backup-volume]# ls -l
total 307580
-rw-r--r--. 1 root root 314961920 Sep  8 14:27 mongovolume.tar.gz
[root@corp backup-volume]#
```

"Cara yang lebih singkat dan sederhana untuk melakukan backup seperti diata"

contoh : docker image pull ubuntu:latest
  docker container run --rm --name ubuntu --mount "type=bind,source=/home/dani/backup-volume,destination=/backup" --mount "type=volume,source=mongovolume,destination=/data" ubuntu:latest tar cvf /backup/mongovolume1.tar.gz /data

```bash
[root@corp ~]# docker container run --rm --name ubuntu --mount "type=bind,source=/home/dani/backup-volume,destination=/backup" --mount "type=volume,source=mongovolume,destination=/data" ubuntu:latest tar cvf /backup/mongovolume1.tar.gz /data

/data/
/data/mongod.lock
/data/journal/
/data/journal/WiredTigerLog.0000000002
/data/journal/WiredTigerPreplog.0000000001
/data/journal/WiredTigerPreplog.0000000002
/data/WiredTiger.lock
/data/WiredTiger
/data/WiredTiger.wt
/data/WiredTiger.turtle
/data/WiredTigerHS.wt
/data/sizeStorer.wt
/data/_mdb_catalog.wt
/data/storage.bson
/data/collection-0-4216942743969268707.wt
/data/index-1-4216942743969268707.wt
/data/collection-2-4216942743969268707.wt
/data/index-3-4216942743969268707.wt
/data/collection-4-4216942743969268707.wt
/data/index-5-4216942743969268707.wt
/data/index-6-4216942743969268707.wt
/data/diagnostic.data/
/data/diagnostic.data/metrics.2023-09-08T06-58-11Z-00000
/data/diagnostic.data/metrics.2023-09-08T06-58-15Z-00000
/data/.mongodb/
/data/.mongodb/mongosh/
/data/.mongodb/mongosh/64fac6030e246bb71b22db38_log
/data/.mongodb/mongosh/config
/data/.mongodb/mongosh/mongosh_repl_history
/data/.mongodb/mongosh/64fac603e4e3ff4b98bcbe45_log
/data/.mongodb/mongosh/snippets/
/data/.mongodb/mongosh/snippets/package.json
/data/.mongodb/mongosh/am-64fac6030e246bb71b22db37.json
/data/collection-7-4216942743969268707.wt
/data/index-8-4216942743969268707.wt
/data/index-9-4216942743969268707.wt
"PROSES BACKUP SELESAI"

"TERLIHAT SUDAH MASUK SISTEM HOST DATA (mongovolume1.tar.gz)"
[root@corp ~]# cd /home/dani/backup-volume/
[root@corp backup-volume]# ls
mongovolume1.tar.gz  mongovolume.tar.gz

"DOCKER CONTAINER UBUNTU YANG KITA RUN SUDAH OTOMATIS TERHAPUS"
[root@corp backup-volume]# cd
[root@corp ~]# docker container ls -a
CONTAINER ID   IMAGE                                          COMMAND                  CREATED          STATUS                      PORTS     NAMES
3f8b819e8770   mongo:latest                                   "docker-entrypoint.s…"   50 minutes ago   Exited (0) 49 minutes ago             daymongodb
73f449d96c1c   nginx:latest                                   "/docker-entrypoint.…"   21 hours ago     Exited (0) 21 hours ago               smallnginx
01fa23ca0bcb   mongo:latest                                   "docker-entrypoint.s…"   22 hours ago     Exited (0) 21 hours ago               corpmongodb
7fc942d12745   opensecurity/mobile-security-framework-mobsf   "/home/mobsf/Mobile-…"   22 hours ago     Exited (0) 21 hours ago               dani-mobsf-1
3f2ad9791abf   nginx:latest                                   "/docker-entrypoint.…"   24 hours ago     Exited (0) 21 hours ago               corpnginx
bc0dbb5776b2   redis:latest                                   "docker-entrypoint.s…"   28 hours ago     Exited (0) 21 hours ago               credis
[root@corp ~]#
```
