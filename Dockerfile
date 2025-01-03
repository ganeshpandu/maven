# Use a specific version of OpenJDK (a slim version to keep the image small)
FROM openjdk:17-jdk-slim

# Update package list and upgrade zlib to the latest secure version
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zlib1g \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the host to the container
COPY target/my-app-1.0-SNAPSHOT.jar /app/app.jar

# Expose the necessary port (if needed for web apps)
EXPOSE 8080

# Run the JAR file
CMD ["java", "-jar", "app.jar"]
