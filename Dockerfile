FROM continuumio/miniconda3:24.1.2-0

SHELL ["/bin/bash", "-c"]

# Install docker
RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy curl && \
    apt-get install -qy rsync && \
    curl -sSL https://get.docker.com/ | sh

WORKDIR /workspace

COPY . .

RUN pip install -r requirements.txt
RUN python -m venv code_execution_env && source code_execution_env/bin/activate && pip install -r requirements.txt && deactivate