"Docker bind mounts merupakan kemampuan untuk melakukan mounting (sharing) folder dalam container"


contoh : docker container create --name namacontainer --publish 27018:27017 --mount "type=value,source=directory-source,destination=folder-directory-container" --env KEY="value" image:tag
  docker container create --name daymongodb --publish 27018:27017 --mount "type=bind,source=/home/dani/mongo-data,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=root --env MONGO_INITDB_ROOT_PASSWORD=mongo12345 mongo:latest
