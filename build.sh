#!/bin/sh

docker build -t betterweb/n8n-docker .
docker push betterweb/n8n-docker