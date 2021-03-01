# Pull base image
FROM python:3.8-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

## Intalling the dependencies of the libraries.
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

## Create the work repository
RUN mkdir /code

## Go to the work path in the container, is like command cd
WORKDIR /code

# Set work directory
WORKDIR /code

# Install dependencies
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system

# Copy project
COPY . /code/
