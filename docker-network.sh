"Membuat docker network untuk antar container"

contoh : 
```bash
docker network ls /'untuk melihat list network'

docker network create --driver bridge mongonetwork /'membuat network (mongonetwork)'
```
docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=root --env MONGO_INITDB_ROOT_PASSWORD=mongo12345 mongo:latest

docker container start mongodb /'untuk menjalankan container mongodb'

docker container create --name mongoexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://root:mongo12345@mongodb:27017/" mongo-express:latest

docker container start mongoexpress /'untuk menjalankan container mongoexpress'

docker network disconnect mongonetwork mongodb /'untuk menonaktifkan mongonetwork pada container (mongodb)'

docker network connect mongonetwork mongodb /'untuk memasukan container (mongodb) ke dalam jaringan (mongonetwork)'
