#!/bin/bash
set -x
docker login
docker build --no-cache --rm -t optaros/php-fpm-7.1:latest .
docker push optaros/php-fpm-7.1:latest
