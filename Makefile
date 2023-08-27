.PHONY: up down restart build

up:
	@mkdir -p /home/rjaanit/data/wp
	@mkdir -p /home/rjaanit/data/db
	cd /home/lagala/Desktop/inception/srcs && docker compose up --build
down:
	cd /home/lagala/Desktop/inception/srcs && docker compose down 

restart:
	cd /home/lagala/Desktop/inception/srcs && docker compose start

build:
	cd /home/lagala/Desktop/inception/srcs && docker compose build
stop:
	cd /home/lagala/Desktop/inception/srcs && docker compose stop
fclean: down
	sudo rm -Rf /home/rjaanit/data/wp
	sudo rm -Rf /home/rjaanit/data/db
	@docker rmi -f $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)