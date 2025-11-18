# ---- Build Stage ----
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# ---- Runtime Stage ----
FROM openjdk:21-jdk-slim

WORKDIR /app

# Copy built jar from build stage
COPY --from=build /app/target/SpringBoot_DemoProject-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]