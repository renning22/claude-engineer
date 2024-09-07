FROM continuumio/miniconda3:24.1.2-0

SHELL ["/bin/bash", "-c"]

# Install docker
RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy curl rsync vim && \
    curl -sSL https://get.docker.com/ | sh

WORKDIR /workspace

COPY . .
RUN pip install -r requirements.txt

WORKDIR /app
