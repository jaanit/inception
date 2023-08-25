# inception
Docker app running wordpress, mysql and nginx on three different containers.
# What is Docker 
Docker is an open-source tool for containerization that streamlines application creation and deployment through the use of containers. 
Containers enable us to bundle all parts of an application into a single package for deployment.
This tool makes it easy for different developers to work on the same project in the same environment without any dependencies or OS issues. 
Docker functions similarly to a virtual machine, however, it enables applications to share the same Linux kernel.
# Docker Client
A Docker Client is a component used by a Docker user to interact with the Docker daemon and issue commands. These commands are based on the Docker API.

# Containers and images
The basic structure of Docker relies on images and containers. We can think of a container as an object and an image as its class.

A container is an isolated system that holds everything required to run a specific application. It is a specific instance of an image that simulates the necessary environment. 
The following is an example command for running an Ubuntu Docker container and accessing the bash shell:
docker run -i -t ubuntu /bin/bash

Images, on the other hand, are used to start up containers. From running containers, we can get images, which can be composed together to form a system-agnostic way of packaging applications.
Images can be pre-built, retrieved from registries, created from already existing ones, or combined together via a common network.

# Dockerfiles
Dockerfiles are how we containerize our application, or how we build a new container from an already pre-built image and add custom logic to start our application. From a Dockerfile, we use the Docker build command to create an image.

Think of a Dockerfile as a text document that contains the commands we call on the command line to build an image.

