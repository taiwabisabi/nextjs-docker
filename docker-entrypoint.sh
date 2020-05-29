#!/bin/sh
set -ea

if [ "$1" = "yarn" ]; then

  yarn config set cache-folder $YARN_CACHE_FOLDER

  if [ ! -f "package.json" ]; then

    echo "No project found at /srv/app"
    echo "Remove .next/ and node_modules/ folders"

    rm -rf .next/
    rm -rf node_modules/

    echo "Let's start !"
    yarn create next-app ./ -e default

  elif [ ! -d "node_modules" ]; then

    echo "Node modules not installed. Installing..."

    if [ -f "yarn.lock" ]; then

      yarn install

    elif [ -f "package-lock.json" ]; then

      npm install

    fi

  fi

fi

echo "Starting your app..."

exec "$@"