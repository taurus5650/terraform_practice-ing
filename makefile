DEV_COMPOSE = docker-compose-dev.yml
DEV_IMAGE = terraform_aws_dev_image
DEV_CONTAINER = terraform_aws_dev

PROD_COMPOSE = docker-compose-prod.yml
PROD_IMAGE = terraform_aws_prod_image
PROD_CONTAINER = terraform_aws_prod

run-dev-docker:
	docker-compose -f $(DEV_COMPOSE) down --volumes --remove-orphans
	docker image prune -f
	- docker rmi $(shell docker images -q $(DEV_IMAGE)) || true
	docker-compose -f $(DEV_COMPOSE) up --build
	docker ps | grep $(DEV_CONTAINER)

run-prod-docker:
	docker-compose -f $(PROD_COMPOSE) down --volumes --remove-orphans
	docker image prune -f
	- docker rmi $(shell docker images -q $(PROD_IMAGE)) || true
	docker-compose -f $(PROD_COMPOSE) up --build
	docker ps | grep $(PROD_CONTAINER)
