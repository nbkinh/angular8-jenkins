FROM node:12-alpine

RUN apk add -U subversion

WORKDIR  /var/www/html

COPY ./package.json ./
COPY ./package-lock.json ./


