"Managemen Logs docker container

#Melihat logs docker container
contoh : docker container logs containerid/namacontainer
  docker container logs xredis

#Melihat logs docker container dan menunggu logs baru
contoh : docker container logs -f containerid/namacontainer
  docker container logs -f xredis
