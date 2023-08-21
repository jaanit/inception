#!/bin/bash
USERNAME="rjaanit"
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)

echo "${RED}By rjaanit ${NORMAL}"

# Stop and remove all containers
docker-compose down -v

# Remove all stopped containers
for container_id in $(docker ps -aq); do
  docker rm -f "$container_id"
done

# Remove all unused images
docker image rm -f $(docker image ls -q) > /dev/null 2>&1
echo "${GREEN}Cleanup complete${NORMAL}"
