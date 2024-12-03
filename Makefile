up-kafka:
	docker compose up -d --build

down-kafka:
	docker compose down

exec-kafka:
	docker exec -it kafka bash

exec-go:
	docker exec -it gokafka bash

up-kafka-kraft:
	docker compose -f docker-compose-kraft.yaml up -d --build

down-kafka-kraft:
	docker compose -f docker-compose-kraft.yaml down

.PHONY: up-kafka down-kafka exec-kafka exec-go up-kafka-kraft  down-kafka-kraft