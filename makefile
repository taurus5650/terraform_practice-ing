DEV_IMAGE=terraform_aws_dev_image
DEV_CONTAINER=terraform_aws_dev

PROD_IMAGE=terraform_aws_prod_image
PROD_CONTAINER=terraform_aws_prod

run-dev-docker:
	docker-compose -f docker-compose-dev.yml down --volumes --remove-orphans
	docker image prune -f
	- docker rmi $(shell docker images -q $(DEV_IMAGE)) || true
	docker-compose -f docker-compose-dev.yml up --build
	docker ps | grep $(DEV_CONTAINER)
