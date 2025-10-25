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

# check if the OUTPUT_DIR environment variable is set
if [ -z "$OUTPUT_DIR" ]; then
    echo "The OUTPUT_DIR environment variable is not set"
    exit 1
fi

echo "Deploying the $LANGUAGE application..."
cd "$DIRECTORY" || (echo "Directory $DIRECTORY not found" && exit 1)

# if $LANGUAGE is "javascript"
if [ "$LANGUAGE" = "javascript" ]; then
    echo "npm install"
    time npm install
    echo "npm run build"
    time npm run build
elif [ "$LANGUAGE" = "repo" ]; then
    # move everything to $OUTPUT_DIR/ including hidden files except .git using rsync
    echo "Creating $OUTPUT_DIR/"
    rsync -av --exclude='.git' . "$OUTPUT_DIR/"
elif [ "$LANGUAGE" = "none" ]; then
    echo "Doing nothing"
elif [ "$LANGUAGE" = "bash" ]; then
        if [ -f ".github/workflows/build.sh" ]; then
            echo "Running .github/workflows/build.sh"
            time bash .github/workflows/build.sh
        elif [ -f "build.sh" ]; then
            echo "Running build.sh"
            time bash build.sh
        fi
else
    echo "Unsupported language: $LANGUAGE"
    exit 1
fi
