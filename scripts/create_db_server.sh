#! /bin/bash
docker rm -f my-postgresql && docker run -d --name my-postgresql \
    -e POSTGRES_PASSWORD=password123 \
    -e POSTGRES_DB=dvdrental \
    --user=postgres \
    -p 5432:5432 \
    postgres:latest
sleep 5

while [ 1 ]
do
    nc -z -v -w5 localhost 5432
    if [ $? -eq 0 ]; 
    then
        echo "Created db server"
        break;
    else
        echo "Still creating.." 
    fi
    sleep 1
done
