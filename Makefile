PROJECT_NAME=monitoringrafana
CONTAINERS_PREFIX=mon\.

default: help

.PHONY: test
test:
	docker ps -a --filter "name=${CONTAINERS_PREFIX}" --format "{{.Names}}"

.PHONY: up
## Brings the containers up
up:
	docker compose up -d

.PHONY: down
## Brings the containers down
down:
	docker compose down

.PHONY: stop
## Stops the containers
stop:
	docker stop $$(docker ps -a --filter "name=${CONTAINERS_PREFIX}" --format "{{.Names}}") || true

.PHONY: ps
## Like `docker ps` but only for this project
ps:
	docker ps -a --filter "name=${CONTAINERS_PREFIX}" --format "{{.Names}}"

.PHONY: exec-grafana
## Enter the grafana container
exec-grafana:
	docker exec -it ${CONTAINERS_PREFIX}grafana bash

.PHONY: exec-prometheus
## Enter the prometheus container
exec-prometheus:
	docker exec -it ${CONTAINERS_PREFIX}prometheus bash

.PHONY: logs
## Follow the containers's logs
logs:
	docker compose logs -f 

.PHONY: rm
## Remove the containers
rm: stop
	docker rm $$(docker ps -a --filter "name=${CONTAINERS_PREFIX}" --format "{{.Names}}") || true

.PHONY: rm-vol
## Remove the volumes
rm-vol: rm
	docker volume rm $$(docker ps -a --filter "name=${CONTAINERS_PREFIX}" --format "{{.Names}}") || true

.PHONY: help
## Print this help (see <https://gist.github.com/klmr/575726c7e05d8780505a> for explanation).
help:
	@echo "$$(tput bold)Available targets:$$(tput sgr0)";sed -ne"/^## /{h;s/.*//;:d" -e"H;n;s/^## //;td" -e"s/:.*//;G;s/\\n## /---/;s/\\n/ /g;p;}" ${MAKEFILE_LIST} | awk -F --- -v n=$$(tput cols) -v i=20 -v a="$$(tput setaf 6)" -v z="$$(tput sgr0)" '{printf"%s%*s%s ",a,-i,$$1,z;m=split($$2,w," ");l=n-i;for(j=1;j<=m;j++){l-=length(w[j])+1;if(l<= 0){l=n-i-length(w[j])-1;printf"\n%*s ",-i," ";}printf"%s ",w[j];}printf"\n";}'
