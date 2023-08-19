FROM debian:bullseye

# php-fpm (fastcgi prosses manager) used to run php scripts
# php-mysql php extension that allows php to communicare with mysql databse

# RUN apt update && \
#     apt install -y php7.3 php-mysqli php7.3-fpm curl && \
#     apt install -y php7.3-curl  && \apt clean && \
#     rm -rf /var/lib/apt/lists/*

RUN apt-get update -y
RUN apt-get install -y php php-mysql wget php-fpm 
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./tools/script.sh /
EXPOSE 9000
CMD ["bash","/script.sh"]
