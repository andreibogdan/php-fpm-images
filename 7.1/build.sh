#!/bin/bash
set -x
docker build --rm -t optaros/php-fpm-7.1:latest .
docker push optaros/php-fpm-7.1:latest
