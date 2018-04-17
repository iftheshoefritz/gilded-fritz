docker-compose build
docker-compose up -d
echo "*"
echo "*"
echo "*"
echo "*** Distributed Tavern ***"
echo "Attaching to gilded client... press i<enter> to see inventory"
docker attach --sig-proxy=false gilded_client
