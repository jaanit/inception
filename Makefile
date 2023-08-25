.PHONY: up down restart build

up:
	cd /Users/rjaanit/Desktop/inception/srcs && docker-compose up -d

down:
	cd /Users/rjaanit/Desktop/inception/srcs && docker-compose down

restart:
	cd /Users/rjaanit/Desktop/inception/srcs && docker-compose restart

build:
	cd /Users/rjaanit/Desktop/inception/srcs && docker-compose build
