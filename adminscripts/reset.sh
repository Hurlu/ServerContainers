docker kill $(docker ps -q);
if [[ $1 == "hard" ]]
then
docker system prune -f -a --volumes;
else
docker system prune -f --volumes;
fi
