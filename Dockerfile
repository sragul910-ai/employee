# Use OpenJDK base image
FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy jar file to container
COPY target/SpringBoot_DemoProject-0.0.1-SNAPSHOT.jar app.jar

# Expose port (update if needed)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

#command to run mysql docker container
# docker run --name mysql-container --network my-network -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=user-info -p 3306:3306 -d mysql:latest