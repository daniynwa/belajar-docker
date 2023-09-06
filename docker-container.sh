"Membuat docker container"

#Melihat semua container
  docker container ls -a

#Melihat container yang aktif / sedang berjalan
  docker container ls

#Membuat container
contoh :  docker container create --name namacontainer namaimage:tag
  docker container create --name xredis redis:latest

#Menjalankan container
contoh : docker container start containerid/namacontainer
  docker container start xredis
