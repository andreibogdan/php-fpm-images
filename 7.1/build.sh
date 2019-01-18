#!/bin/bash
docker build --rm -t optaros/php:7.1-fpm .
docker push optaros/php:7.1-fpm