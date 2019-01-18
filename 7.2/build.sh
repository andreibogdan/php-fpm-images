#!/bin/bash
docker build --rm -t optaros/php:7.2-fpm .
docker push optaros/php:7.2-fpm