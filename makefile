# Makefile to set up and tear down Docker containers using Docker Compose

# Start Docker Compose
up:
	docker-compose -f srcs/docker-compose.yml up -d --build

# Stop Docker Compose
down:
	docker-compose -f srcs/docker-compose.yml down

# Clean Docker data
clean:
	docker stop $(docker ps -qa)
	docker rm $(docker ps -qa)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q) 2>/dev/null

# Full rebuild
re: clean up
