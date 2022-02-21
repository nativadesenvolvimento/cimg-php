#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 8.1/Dockerfile -t nativa/circle-ci-php:8.1.3  -t nativa/circle-ci-php:8.1 .
docker build --file 8.1/node/Dockerfile -t nativa/circle-ci-php:8.1.3-node  -t nativa/circle-ci-php:8.1-node .
docker build --file 8.1/browsers/Dockerfile -t nativa/circle-ci-php:8.1.3-browsers  -t nativa/circle-ci-php:8.1-browsers .
