# Use a specific version of OpenJDK
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the host to the container
COPY /home/jenkins/my-app/target/my-app-1.0-SNAPSHOT.jar /app/app.jar

# Expose the necessary port (if needed for web apps)
EXPOSE 8080

# Run the JAR file
CMD ["java", "-jar", "app.jar"]
