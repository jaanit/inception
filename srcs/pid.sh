#!/bin/bash

# Get a list of running container IDs and names
container_info=$(docker ps --format "{{.ID}}:{{.Names}}")

# Iterate through each container info
while IFS= read -r info; do
    container_id="${info%%:*}"
    container_name="${info#*:}"
    
    pid=$(docker inspect --format "{{.State.Pid}}" "$container_id")
    init_process_cmd=$(docker exec -it "$container_id" cat /proc/1/cmdline | tr '\0' ' ')
    
    echo "Container Name: $container_name (PID 1: $pid)"
    fi
    echo "--------------------------------------"
done <<< "$container_info"

