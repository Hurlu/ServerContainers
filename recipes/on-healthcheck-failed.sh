docker ps -f name=mealie --format "{{.Status}}" | grep "unhealthy";
if [ $? -eq 0 ]; then
docker-compose down; docker-compose up -d --build;
fi

