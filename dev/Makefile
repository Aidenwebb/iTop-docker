.POSIX:

DOCKER_TAG = itop-docker
DOCKER_REVISION = dev-local

build:
	docker build -t ${DOCKER_TAG}:${DOCKER_REVISION} ../itop

dev: 
	@echo "Building dev..."
	make build
	@docker compose -f docker-compose.yml up -d
	@echo "Done!"

down:
	@echo "Stopping dev..."
	@docker compose -f docker-compose.yml down
	@echo "Done!"

reload:
	@echo "Reloading dev..."
	@docker compose -f docker-compose.yml up -d --force-recreate
	@echo "Done!"

rebuild:
	@echo "Rebuilding dev..."
	make build
	@docker compose -f docker-compose.yml down --remove-orphans
	@docker compose -f docker-compose.yml up -d --force-recreate
	@echo "Done!"

reset:
	@echo "Resetting dev..."
	@docker compose -f docker-compose.yml down --remove-orphans --volumes
	@docker compose -f docker-compose.yml up -d --force-recreate
	@echo "Done!"

clean:
	@echo "Cleaning dev..."
	@docker compose -f docker-compose.yml down --remove-orphans --rmi all --volumes
	@echo "Done!"

