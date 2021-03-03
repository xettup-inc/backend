# App Xettup

## Installation backend
Lo primero que debemos es allanar las bases de nuestro entorno de desarrollo:

> ¿Como lo haremos?

Previamente tener instalado:

- Python 3.x, [Python docs](https://www.python.org/).
- Docker, [Docker docs](https://docs.docker.com/engine/install/).
- Docker Compose, [Docker docs](https://docs.docker.com/compose/install/).

Una vez listo lo anterior, seguimos con:

- instalar pipenv
```bash
pip install pipenv
```

- Crear el archivo **.env**
```
backend
│   .env
│
```

-  copiar y pegar el archivo el contenido del archivo **.env.example** en el **.env**
the next step is to run
```
backend
│   .env
│   .env.example
│
```

- Crear el archivo **.docker-compose.override.yml**
```
backend
│   .docker-compose.override.yml
│
```

- Copie y pegue lo siguiente en el **.docker-compose.override.yml**
```
version: "3.3"

services:
  db:
    environment:
      POSTGRES_HOST_AUTH_METHOD: ${PROTOTYPE_DB_HOST_AUTH_METHOD}
    ports:
      - "5432:5432"
```