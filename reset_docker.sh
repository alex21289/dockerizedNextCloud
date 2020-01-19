#!/bin/bash

echo "Es werden alle Container, Images und Netzwerke gelöscht"

#Löscht alle Container
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)

#Löscht alle nicht benutzen Volumes
docker volume prune

#Löscht alle nicht benutzen Netzwerke
docker network prune

######### DANGER ZONE ################
#docker image rm $(docker image ls -aq)
#docker system prune -f
#docker system prune --volumes -a -f
######################################


echo "Löschen abgeschlossen..."
echo "Erzeuge neues Docker Netzwerk"

#docker network create nextcloud_network

echo "Lösche Volume-Ordner..."

rm -f -r app/
rm -f -r proxy/

echo "Ordner gelöscht"
ls -l
docker network ls

docker-compose up -d
