#!/bin/bash
docker build --rm -t optaros/php-fpm-7.2:latest .
docker push optaros/php-fpm-7.2:latest
