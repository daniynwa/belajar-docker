"Cara Melakukan restore pada docker volume"

contoh : docker volume create mongorestore

docker container run --rm --name ubuntu --mount "type=bind,source=/home/dani/backup-volume,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup//mongovolume1.tar.gz --strip 1"
