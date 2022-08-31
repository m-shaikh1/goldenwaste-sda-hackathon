FROM maven:3.8.6-jdk-11 AS build
EXPOSE 8080
WORKDIR /var/www
COPY . .
RUN mvn package

CMD ["catalina.sh", "run"]
