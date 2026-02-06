# Inception

A Docker-based infrastructure project that sets up a small network of services using Docker Compose. The project orchestrates three main containers:

- **NGINX**: Acts as the web server and entry point, handling SSL/TLS.
- **WordPress**: The content management system running on PHP-FPM.
- **MariaDB**: The database management system for WordPress.

## Prerequisites

- **Docker**: Ensure Docker is installed and running.
- **Docker Compose**: Required for orchestrating multi-container applications.
- **Make**: Used to simplify build and management commands.

## Project Structure

```
.
├── Makefile                # Management commands
├── README.md               # Project documentation
└── srcs                    # Source configurations
    ├── .env                # Environment variables
    ├── clean.sh            # Cleanup script
    ├── docker-compose.yml  # Docker Compose configuration
    ├── pid.sh              # PID checking script
    └── requirements        # Docker build contexts
        ├── mariadb
        ├── nginx
        └── wordpress
```

## Configuration

### Environment Variables

The project uses a `.env` file located in `srcs/` to configure services. It includes database credentials, domain names, and other settings.

> **Note:** The default `.env` contains credentials for testing purposes. For production use, please change them.

### Data Storage

The project is configured to use persistent storage volumes located at `/home/rjaanit/data/wp` and `/home/rjaanit/data/db` (as defined in `srcs/docker-compose.yml` and `Makefile`).

If you are running this on a different user or system, you **must** update the paths in:
1. `Makefile` (under the `up` and `fclean` targets)
2. `srcs/docker-compose.yml` (under the `volumes` section)

## Usage

Use the provided `Makefile` to manage the lifecycle of the application.

### Build and Start

To build the images and start the containers in the background:

```bash
make up
```

This command will:
1. Create the necessary data directories (e.g., `/home/rjaanit/data/...`).
2. Build the Docker images for MariaDB, WordPress, and NGINX.
3. Start the containers.

### Stop and Remove

To stop and remove the containers:

```bash
make down
```

### Start / Stop

To start stopped containers without rebuilding:
```bash
make start
```

To stop running containers without removing them:
```bash
make stop
```

### Clean / Reset

To remove all containers, images, volumes, and data directories (WARNING: This will delete all data in the volumes):

```bash
make fclean
```

> **Note:** `make fclean` uses `sudo` to remove the data directories.

## Services Overview

### MariaDB
- **Build Context:** `srcs/requirements/mariadb`
- **Port:** Internal only (accessible by WordPress container)
- **Volume:** Persists database data.

### WordPress
- **Build Context:** `srcs/requirements/wordpress`
- **Port:** Internal only (accessible by NGINX container)
- **Dependencies:** Waits for MariaDB to be ready.

### NGINX
- **Build Context:** `srcs/requirements/nginx`
- **Port:** 443 (HTTPS)
- **Dependencies:** Waits for WordPress to be ready.
- **Volume:** Persists WordPress files.

## Accessing the Application

Once the containers are up and running, you can access the WordPress site by navigating to `https://localhost` (or the domain configured in your `.env` file, e.g., `rjaanit.42.fr`) in your web browser.

> Note: Since the project uses a self-signed certificate, your browser may warn you about the security of the connection. You can proceed safely for development purposes.
