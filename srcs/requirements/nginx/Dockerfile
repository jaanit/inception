FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y openssl

RUN mkdir -p /etc/certs && openssl req -new -newkey rsa:2048 -x509 -nodes -out /etc/certs/rjaanit_42_fr.csr -keyout /etc/certs/rjaanit_42_fr.key -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/CN=rjaanit.42.fr"
# openssl req -new -newkey rsa:2048 -nodes -out rjaanit_42_fr.csr -keyout rjaanit_42_fr.key -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/CN=rjaanit.42.fr"
COPY ./conf/default  ./etc/nginx/sites-available/default

COPY ./tools/tools.sh ./etc/nginx/

EXPOSE 443
RUN chmod +x ./etc/nginx/tools.sh

CMD ["./etc/nginx/tools.sh"]
