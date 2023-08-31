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

# Layers
A Dockerfile works in layers. These are the building blocks of Docker. The first layer starts with the FROMkeyword and defines which pre-built image we will use to build an image. We can then define user permissions and startup scripts.

In Docker, a container is an image with a readable layer built on top of a read-only layer. These layers are called intermediate images, and they are generated when we execute the commands in our Dockerfile during the build stage.

# Docker Registry
Docker Registry is a centralized location for storing and distributing Docker images. The most commonly used public registry is Docker Hub, but you can also create your own private registry.

# Docker Daemon
Docker Daemon runs on a host machine and manages containers, images, networks, and volumes. It receives commands from the Docker client and executes them. The Docker daemon uses Docker images to create containers.

#Docker Hub
Docker Hub is a Docker Registry that provides unlimited storage for public images and offers paid plans for hosting private images. Anybody can access a public image. But to publish and access images on Docker Hub, you must create an account first.

# Dockerfile vs Docker Compose
Both Dockerfile and Docker Compose are tools in the Docker image ecosystem. Dockerfile is a text file that contains an image, and the commands a developer can call to assemble the image. The commands are typically simple processes like installing dependencies, copying files, and configuring settings.

Docker Compose is a tool for defining and running multi-container Docker applications. Information describing the services and networks for an application are contained within a YAML file, called docker-compose.yml.

One of the base functions of Docker Compose is to build images from Dockerfiles. However, Docker Compose is capable of orchestrating the containerization and deployment of multiple software packages. You can select which images are used for certain services, set environment-specific variables, configure network connections, and much more.
In summary, Dockerfiles define the instructions to a single image in an application, but Docker Compose is the tool that allows you to create and manipulate a multi-container application.
