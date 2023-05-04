.POSIX:

DOCKER_TAG = itop-docker
DOCKER_REVISION ?= dev-$(USER)

build:
	docker build -t ${DOCKER_TAG}:${DOCKER_REVISION} ./itop

dev: 
	@echo "Building dev..."
	@docker compose -f docker-compose.dev.yml up -d
	@echo "Done!"

down:
	@echo "Stopping dev..."
	@docker compose -f docker-compose.dev.yml down
	@echo "Done!"

reload:
	@echo "Reloading dev..."
	@docker compose -f docker-compose.dev.yml up -d --force-recreate
	@echo "Done!"

rebuild:
	@echo "Rebuilding dev..."
	@docker compose -f docker-compose.dev.yml down --remove-orphans
	@docker compose -f docker-compose.dev.yml up -d --force-recreate --build
	@echo "Done!"

reset:
	@echo "Resetting dev..."
	@docker compose -f docker-compose.dev.yml down --remove-orphans --volumes
	@docker compose -f docker-compose.dev.yml up -d --force-recreate
	@echo "Done!"

clean:
	@echo "Cleaning dev..."
	@docker compose -f docker-compose.dev.yml down --remove-orphans --rmi all --volumes
	@echo "Done!"

