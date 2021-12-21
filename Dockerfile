# Use Python38
FROM python:3.8-slim-buster
# Copy requirements.txt to the docker image and install packages
COPY requirements.txt /
RUN apt-get update -y
RUN pip3 install -r requirements.txt
# Set the WORKDIR to be the folder
COPY . /app
# Expose port 32111
EXPOSE 32111
ENV PORT 32111
WORKDIR /app
RUN python3 Service.py
RUN python3 container_model.py