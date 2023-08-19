#!/bin/bash
docker compose down -v
docker rm $(docker ps -aq)
docker image rm $(docker image ls -q)


