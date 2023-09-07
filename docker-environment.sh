"Untuk menambahkan environment variable pad docker container"

/biasa digunakan ketika kita menggunakan database "mongodb"

contoh : docker container create --name namacontainer --env KEY="value" image:tag
  docker container create --name corpmongodb --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=root --env MONGO_INITDB_ROOT_PASSWORD=mongo12345
