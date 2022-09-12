FROM maven:3.8.6-openjdk-11
ENV GOLDEN_DB_URL=devops22.cehxjqytwbqs.us-east-1.rds.amazonaws.com
ENV GOLDEN_DB_NAME=goldendb
ENV GOLDEN_DB_USERNAME=admin
ENV GOLDEN_DB_PASSWORD=DevOps2022
ENV GOLDEN_DB_PORT=3306
WORKDIR /app
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]
COPY . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/goldenWastedd-0.0.1-SNAPSHOT.jar"]
