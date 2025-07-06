.PHONY: terraform-init terraform-apply ssh-deploy build up down

terraform-init:
	cd deployment/terraform && terraform init

terraform-apply:
	cd deployment/terraform && terraform apply -auto-approve

ssh-deploy:
	gcloud compute ssh docker-vm --zone=asia-east1-b --command="cd app && make up"

build:
	docker-compose -f deployment/docker/docker-compose-prod.yml build

up:
	docker-compose -f deployment/docker/docker-compose-prod.yml up -d --build

down:
	docker-compose -f deployment/docker/docker-compose-prod.yml down
