
up:
	docker compose -f requirements/srcs/docker-compose.yml up --build


down:
	docker compose -f requirements/srcs/docker-compose.yml down -v


prune :
	docker compose -f requirements/srcs/docker-compose.yml down -v
	docker volume prune 
	docker system prune -af


clean:
	docker stop $(docker ps -qa)
	docker rm $(docker ps -qa)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q) 2>/dev/null

re: clean up
