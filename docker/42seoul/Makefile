# Vars ==========================

PROJECT	=	42seoul
IMAGE	=	petercha2000/env:42seoul

# Rules =========================

all		: build clean

.PHONY: run
run		: deploy clean

.PHONY: build
build	:
	docker buildx build --platform linux/arm64,linux/amd64 --push --no-cache -t $(IMAGE) .

.PHONY: clean
clean	:
	@sudo docker rmi $(shell (sudo docker images --filter "dangling=true" -q --no-trunc)) 2>/dev/null | cat
	@sudo docker rm -f $(shell (sudo docker ps | grep buildx | cut -d " " -f 1 )) 2> /dev/null | cat

.PHONY: fclean
fclean	: clean
	sudo docker-compose -p $(PROJECT) down
	sudo docker-compose -p $(PROJECT) rm
	sudo docker rmi $(IMAGE)

.PHONY: deploy
deploy	:
	sudo docker-compose pull
	sudo docker-compose -p $(PROJECT) up -d

.PHONY: re
re		: fclean all
