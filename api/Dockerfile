# --- Stage 1: Build ---
# Use the official Maven image to build the app
FROM maven:3.8.5-openjdk-17 AS builder

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
COPY mvnw.cmd .

# Download dependencies (this layer is cached)
RUN mvn dependency:go-offline -B

# Copy the rest of the source code
COPY src src

# Build the application
RUN mvn package -DskipTests

# --- Stage 2: Run ---
# Use a lightweight JRE image to run the app
FROM eclipse-temurin:17-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the built .jar file from the 'builder' stage
# Make sure to change 'api-0.0.1-SNAPSHOT.jar' if your artifactId/version is different!
COPY --from=builder /app/target/api-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]