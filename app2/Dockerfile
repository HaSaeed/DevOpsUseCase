# Use a base image with Python
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Python file into the container
COPY . .

# Install the artifact
RUN pip install dist/world_app-0.1-py3-none-any.whl

# Command to run the Python application
CMD ["world_app"]
