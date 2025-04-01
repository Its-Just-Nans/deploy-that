#!/bin/bash

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
