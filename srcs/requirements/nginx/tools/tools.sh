#!/bin/bash

# This is a sample script to demonstrate execution within the Docker container
sleep 5
echo "Hello from  the container!"
echo "Starting Nginx..."
nginx -g "daemon off;"
 