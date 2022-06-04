rm -rf dvdrental.tar
unzip dvdrental.zip
docker exec -i my-postgresql pg_restore -U postgres -d dvdrental < dvdrental.tar