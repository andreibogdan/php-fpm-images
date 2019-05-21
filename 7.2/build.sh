#!/bin/bash
set -ex
docker login
docker build --no-cache --rm -t optaros/php-fpm-7.2:latest .
docker push optaros/php-fpm-7.2:latest
