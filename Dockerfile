
# Use a base image with Java
FROM openjdk:11-jdk-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Java file into the container
COPY HelloWorld.java .

# Compile the Java file
RUN javac HelloWorld.java

# Command to run the compiled Java application
CMD ["java", "HelloWorld"]
