# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM python:3.10-alpine AS builder
WORKDIR /app
COPY requirements.txt /app/
RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt

COPY . /app

EXPOSE 5000
ENV FLASK_ENV=development
ENV PORT=5000
ENV MONGO_HOST=todo-database
ENV MONGO_PORT=27017

# CMD ["python3", "app.py"]

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]

