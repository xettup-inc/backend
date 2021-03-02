SHELL := /bin/bash

include .env

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## Make venv and install requirements
	pipenv install --dev

migrate: ## Make and run migrations
	pipenv run python app/manage.py makemigrations
	pipenv run python app/manage.py migrate

db-up: ## Pull and start the Docker Postgres container in the background
	docker rm -f database
	docker-compose run --rm --service-ports --name database db

db-shell: ## Access the Postgres Docker database interactively with psql
	docker exec -it database psql -U $(PROTOTYPE_DB_USER) -d $(PROTOTYPE_DB_NAME)

.PHONY: test
test: ## Run tests
	pipenv run python app/manage.py test application --verbosity=0 --parallel --failfast

.PHONY: run
run: ## Run the Django server
	pipenv run python app/manage.py runserver

start: install migrate run ## Install requirements, apply migrations, then start development server
