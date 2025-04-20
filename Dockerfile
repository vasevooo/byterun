# Use an official Python 3.5 runtime as a parent image
FROM python:3.5.10-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt (if you had one)
# For this project, we mainly need pytest
RUN pip install --no-cache-dir pytest==6.1.2 # Pin pytest version used in logs

# Make port 80 available to the world outside this container (if needed, not for tests)
# EXPOSE 80

# Define environment variable
ENV NAME Byterun

# Run pytest when the container launches
CMD ["python", "-m", "pytest"] 