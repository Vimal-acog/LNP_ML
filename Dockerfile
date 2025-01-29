# Python 3.8 as the base image
FROM python:3.8-buster

# Poetry
RUN pip install poetry==1.8.4

# Environment variables for Poetry and Python
ENV \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

# Working directory in the container
WORKDIR /LNP_ML

# Install Git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone the repo
RUN git clone https://github.com/Vimal-acog/LNP_ML.git /LNP_ML

# Install dependencies
RUN rm -rf /LNP_ML/.venv && poetry install && rm -rf /tmp/poetry_cache

# Set the working directory to the scripts folder
WORKDIR /LNP_ML/scripts

# Copy the automation script into the container
COPY scripts/run_commands.py /LNP_ML/scripts/run_commands.py

# Set the entry point to run the automation script
ENTRYPOINT ["poetry", "run", "python", "run_commands.py"]

