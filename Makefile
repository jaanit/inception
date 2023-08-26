.PHONY: up down restart build

up:
	@mkdir -p /home/rjaanit/data/wp
	@mkdir -p /home/rjaanit/data/db
	cd /home/lagala/Desktop/inception/srcs && docker compose up --build
down:
	cd /home/lagala/Desktop/inception/srcs && docker compose down 

restart:
	cd /home/lagala/Desktop/inception/srcs && docker compose restart

build:
	cd /home/lagala/Desktop/inception/srcs && docker compose build
fclean: down
	sudo rm -Rf /home/rjaanit/data/wp
	sudo rm -Rf /home/rjaanit/data/db
	sudo docker volume rm srcs_wp
	sudo docker volume rm srcs_db