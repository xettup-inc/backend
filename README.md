# Xettup App

## Installation backend
The first thing we must do is pave the foundations of our development environment:

> How will we do it?

Previously have installed:

- Python 3.x, [Python docs] (https://www.python.org/).
- Docker, [Docker docs] (https://docs.docker.com/engine/install/).
- Docker Compose, [Docker docs] (https://docs.docker.com/compose/install/).

Once the above is ready, we continue with:

- install pipenv
bash
pip install pipenv
`` ''

- Create the **. Env ** file
`` ''
backend
│ .env
│
`` ''

- copy and paste the file the content of the file **. env.example ** in the **. env **
the next step is to run
`` ''
backend
│ .env
│ .env.example
│
`` ''

- Create the file **. Docker-compose.override.yml **
`` ''
backend
│ .docker-compose.override.yml
│
`` ''

- Copy and paste the following into the **. Docker-compose.override.yml **
`` ''
version: "3.3"

services:
  db:
    environment:
      POSTGRES_HOST_AUTH_METHOD: $ {PROTOTYPE_DB_HOST_AUTH_METHOD}
    ports:
      - "5432: 5432"
`` ''