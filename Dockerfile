FROM tomcat:latest AS base
EXPOSE 8080

FROM maven:3.8.6-jdk-11 AS build
WORKDIR /var/www
COPY . .
RUN mvn package

FROM base AS final 
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /var/www/target/helloworld.war helloworld.war
CMD ["catalina.sh", "run"]