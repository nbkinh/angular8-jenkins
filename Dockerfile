FROM node:12-alpine

RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    gifsicle \
    ttf-freefont \
    optipng \
    cairo-dev \
    jpeg-dev \
    udev \
    chromium \
    git \
    && npm i npm@latest -g

ENV CHROME_BIN /usr/bin/chromium-browser
ENV LIGHTHOUSE_CHROMIUM_PATH /usr/bin/chromium-browser
ENV myName="this is my name"

WORKDIR /home/node/app

