"Docker bind mounts merupakan kemampuan untuk melakukan mounting (sharing) folder dalam container"


contoh : docker container create --name namacontainer --mount "type=value,source=directory-source,destination=folder-directory-container" --publish 27018:27017 --env KEY="value" image:tag
  docker container create --name corpmongodb --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=root --env MONGO_INITDB_ROOT_PASSWORD=mongo12345
