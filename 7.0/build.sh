#!/bin/bash
docker build --rm -t optaros/php-fpm-7.0:latest .
docker push optaros/php-fpm-7.0:latest
