GITHUB_SHA?=latest
APP_VERSION=latest
APP_NAME=marvin-web

LOCAL_TAG=$(APP_NAME):$(APP_VERSION)

build:
	docker build -t $(APP_NAME) .

shell:
	docker exec -ti `docker ps | grep $(LOCAL_TAG) | cut -d' ' -f1` sh

start:
	docker run -d -p 8080:80 $(LOCAL_TAG)

stop:
	docker stop `docker ps | grep $(LOCAL_TAG) | cut -d' ' -f1`

test:
	curl -w "\n" http://localhost:8080/
