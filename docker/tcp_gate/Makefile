# Vars =========================

PROJECT         =		tcp_gate
CONTAINER       =		tcp_gate
NET             =		tcp_gate

# Rules =========================

all     : reload

.PHONY: reload
reload  :
		@sudo docker exec $(CONTAINER) nginx -t
		@sudo docker exec $(CONTAINER) service nginx reload

.PHONY: build
build   :
		sudo docker-compose build
		sudo docker network create $(NET) | cat
		sudo docker-compose -p $(PROJECT) up -d

.PHONY: fclean
fclean  :
		sudo docker network rm $(NET) | cat
		sudo docker-compose -p $(PROJECT) down

.PHONY: re
re              : fclean build all
