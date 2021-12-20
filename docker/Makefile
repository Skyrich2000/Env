# Rules =========================

all		: deploy clean

42seoul	: build push clean

build	:
	sudo docker-compose build

push	:
	sudo docker-compose push

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

.PHONY: all 42seoul build push fclean re deply

