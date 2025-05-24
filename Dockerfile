FROM ubuntu:latest

RUN apt-get update && apt-get install -y 

WORKDIR /var/www/html

#COPY source dest
COPY . .

EXPOSE 80

CMD [ "apachectl","-D","FOREGROUND" ]