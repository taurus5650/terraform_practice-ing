DEPLOYMENT_PATH := ./deployment/docker/
DOCKER_COMPOSE_FILE_PROD := $(DEPLOYMENT_PATH)docker-compose-prod.yml
DOCKER_COMPOSE_FILE_DEV := $(DEPLOYMENT_PATH)docker-compose-dev.yml

.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make run-dev-docker"
	@echo "  make run-prod-docker"


.PHONY: run-dev-docker
run-dev-docker:
	@echo "========== 1. Stopping and cleaning up =========="
	docker compose -f $(DOCKER_COMPOSE_FILE_DEV) down
	docker system prune -a --volumes -f
	@echo "========== 2. Building =========="
	docker compose -f $(DOCKER_COMPOSE_FILE_DEV) build
	@echo "========== 3. Starting =========="
	docker compose -f $(DOCKER_COMPOSE_FILE_DEV) up -d
	@echo "========== 4. Status =========="
	docker compose -f $(DOCKER_COMPOSE_FILE_DEV) ps
	@echo "========== Docker Compose Process Complete =========="


.PHONY: run-prod-docker
run-prod-docker:
	@echo "========== 1. Stopping and cleaning up =========="
	docker compose -f $(DOCKER_COMPOSE_FILE_PROD) down
	docker system prune -a --volumes -f
	@echo "========== 2. Building =========="
	docker compose -f $(DOCKER_COMPOSE_FILE_PROD) build
	@echo "========== 3. Starting =========="
	docker compose -f $(DOCKER_COMPOSE_FILE_PROD) up -d
	@echo "========== 4. Status =========="
	docker compose -f $(DOCKER_COMPOSE_FILE_PROD) ps
	@echo "========== Docker Compose Process Complete =========="