up-zoo:
	docker compose -f docker-compose-zookeeper.yaml up -d --build

down-zoo:
	docker compose -f docker-compose-zookeeper.yaml down

exec-kafka:
	docker exec -it kafka bash

up-kraft:
	docker compose -f docker-compose-kraft.yaml up -d --build

down-kraft:
	docker compose -f docker-compose-kraft.yaml down

.PHONY: up-zoo down-zoo exec-kafka up-kraft  down-kraft