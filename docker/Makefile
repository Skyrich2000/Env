# Vars =========================

FILE_1		=	42seoul.Dockerfile
IMAGE_1		=	petercha2000/env:42seoul

# Rules =========================

all		: deploy clean

42seoul	: build push clean

build	:
	sudo docker build --no-cache -f $(FILE_1) -t $(IMAGE_1) .

push	:
	sudo docker push $(IMAGE_1)

clean	:
	@sudo docker rmi $(shell (sudo docker images --filter "dangling=true" -q --no-trunc)) 2>/dev/null | cat

fclean	: clean
	sudo docker-compose -p Env down
	sudo docker-compose -p Env rm
	sudo docker rmi $(IMAGE_1)

deploy	:
	sudo docker-compose pull
	sudo docker-compose -p Env up -d

re		: fclean all

.PHONY: all build push fclean re dist

