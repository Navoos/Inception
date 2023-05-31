SCRIPT=./srcs/requirements/tools/setup.sh


all:
	@$(SCRIPT) && docker compose -f srcs/docker-compose.yml up --build
fast:
	@$(SCRIPT) && docker compose -f srcs/docker-compose.yml up  
clean:
	@docker compose -f srcs/docker-compose.yml down

fclean: clean
	sudo rm -rf ~/data
re: fclean all

