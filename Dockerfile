# Pull base image
FROM python:3.8-alpine

# Set environment variables
ENV PATH="/scripts:${PATH}"
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

## Intalling the dependencies of the libraries.
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev libc-dev linux-headers

## Create the work repository
RUN mkdir /code

# Set work directory
WORKDIR /code

# Install dependencies
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system

# Copy project
COPY ./app/ /code/

# Copy the scripts folder
COPY ./scripts /scripts
RUN chmod +x /scripts/*

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

CMD ["entrypoint.sh"]

