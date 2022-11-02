#!/usr/bin/env bash

rm -Rf ./dist

# Build wheel for all-in-one package
python -m build --no-isolation

# Build wheel for app1
# If CI was a bit more elaborate, we could fetch from artifacts
python -m build ../app1 --outdir ./dist --no-isolation

# Build wheel for app2
# If CI was a bit more elaborate, we could fetch from artifacts
python -m build ../app2 --outdir ./dist --no-isolation

# Build docker image
docker buildx build --tag all-in-one:latest --load -f Dockerfile .
