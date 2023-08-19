FROM debian:bullseye

# Install packages
RUN apt-get update && apt-get install -y mariadb-server

# Copy files
COPY ./tools/init.sh  ./etc/mariadb/
RUN chmod +x ./etc/mariadb/init.sh
CMD ["./etc/mariadb/init.sh"]