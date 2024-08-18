#!/bin/bash

# Exit on failure
set -e

if [ $# -eq 0 ]
  then
    echo "invalid command"
    exit 1
fi


if [ $1 = "build" ] || [ $1 = "b" ]
  then
    echo Running command: docker compose build --build-arg RUNNER_GID=$(id -g) --build-arg RUNNER_UID=$(id -u) "${@:2}"
    docker compose build --build-arg RUNNER_GID=$(id -g) --build-arg RUNNER_UID=$(id -u) "${@:2}"
    exit 0
fi

if [ $1 = "up" ] || [ $1 = "u" ]
  then
    echo "Running command: docker compose up -d --remove-orphans ${@:2}"
    docker compose up -d --remove-orphans ${@:2}
    exit 0
fi

if [ $1 = "stop" ] || [ $1 = "s" ]
  then
    echo "Running command: docker compose stop ${@:2}"
    docker compose stop ${@:2}
    exit 0
fi

if [ $1 = "restart" ] || [ $1 = "rs" ]
  then
    echo "Running command: docker compose restart ${@:2}"
    docker compose restart ${@:2}
    exit 0
fi

if [ $1 = "down" ] || [ $1 = "d" ]
  then
    echo "Running command: docker compose down ${@:2}"
    docker compose down ${@:2}
    exit 0
fi

if [ $1 = "run" ] || [ $1 = "r" ]
  then
    echo "Running command: docker compose exec rails ${@:2}"
    docker compose exec rails ${@:2}
    exit 0
fi

if [ $1 = "rails" ] || [ $1 = "rr" ]
  then
    echo "Running command: docker compose exec rails bin/rails ${@:2}"
    docker compose exec rails bin/rails ${@:2}
    exit 0
fi

if [ $1 = "rake" ] || [ $1 = "rk" ]
  then
    echo "Running command: docker compose exec rails bin/rake ${@:2}"
    docker compose exec rails bin/rake ${@:2}
    exit 0
fi

if [ $1 = "cs" ]
  then
    echo "Running command: docker compose exec rails bin/rake standard ${@:2}"
    docker compose exec rails bin/rake standard ${@:2}
    exit 0
fi

if [ $1 = "cs:fix" ]
  then
    echo "Running command: docker compose exec rails bin/rake standard:fix ${@:2}"
    docker compose exec rails bin/rake standard:fix ${@:2}
    exit 0
fi

if [ $1 = "test" ] || [ $1 = "t" ]
  then
    echo "Running command: docker compose exec rails bin/rails test ${@:2}"
    docker compose exec rails bin/rails test ${@:2}
    exit 0
fi

if [ $1 = "log" ] || [ $1 = "logs" ] || [ $1 = "l" ]
  then
    echo "Running command: docker compose logs ${@:2}"
    docker compose logs ${@:2}
    exit 0
fi

echo "Running command: docker compose ${@:1}"
docker compose ${@:1}
