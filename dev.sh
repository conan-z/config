#!/bin/bash

readonly arg=$1

if [ "$#" -lt 1 ]; then
	echo "Usage: local-dev-start.sh [r|s] r for run and s for stop"
fi

# Rquired to run once:

# docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

# docker run -d -p 27017:27017 --name mongo mongo:3.4

# docker run -d -p 5432:5432 --name local-postgres -e POSTGRES_PASSWORD=postgres postgres

# docker run -d -p 15672:15672 -p 5672:5672 --name rabbit rabbitmq:3-management

# docker pull jboss/keycloak
# docker run -d -p 9999:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin --name keycloak jboss/keycloak

if [ "$arg" == "r" ]; then
	echo "=== SonarQube ==="
	docker start sonarqube
	echo "Started SonarQube "

	echo "=== MongoDB ==="
	docker start mongo
	echo "Started MongoDB"

	echo "=== PostgreSQL ==="
	docker start local-postgres
	echo "Started PostgreSQL"

	echo "=== RabbitMQ ==="
	docker start rabbit
	echo "Started RabbitMQ"

	echo "=== Keycloak ==="
	docker start keycloak
	echo "Started Keycloak"

	echo "=== All services started ==="
fi

if [ "$arg" == "s" ]; then
	echo "=== SonarQube ==="
	docker stop sonarqube
	echo "Stopped SonarQube "

	echo "=== MongoDB ==="
	docker stop mongo
	echo "Stopped MongoDB"

	echo "=== PostgreSQL ==="
	docker stop local-postgres
	echo "Stopped PostgreSQL"

	echo "=== Keycloak ==="
	docker stop keycloak
	echo "Started Keycloak"

	echo "=== All services stopped ==="
fi
