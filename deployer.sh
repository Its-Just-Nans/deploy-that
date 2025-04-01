#!/bin/bash

# check if the LANGUAGE environment variable is set
if [ -z "$LANGUAGE" ]; then
    echo "The LANGUAGE environment variable is not set"
    exit 1
fi

# check if the DIRECTORY environment variable is set
if [ -z "$DIRECTORY" ]; then
    echo "The DIRECTORY environment variable is not set"
    exit 1
fi

echo "Deploying the $LANGUAGE application..."
cd "$DIRECTORY" || (echo "Directory $DIRECTORY not found" && exit 1)

# if $LANGUAGE is "javascript"
if [ "$LANGUAGE" = "javascript" ]; then
    npm install
    npm run build
else
    echo "Unsupported language: $LANGUAGE"
    exit 1
fi
