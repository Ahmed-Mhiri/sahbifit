# Stage 1: Build the application
# Use a Maven image that includes Java 25 (Eclipse Temurin)
FROM maven:3.9-eclipse-temurin-25 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the rest of the source code and build the application
COPY src ./src
RUN mvn package -DskipTests

# Stage 2: Create the final, lightweight image
# Use a slim JRE (Java Runtime Environment) image for Java 25
FROM eclipse-temurin:25-jre-alpine

WORKDIR /app

# Copy the built JAR file from the 'build' stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your application runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]