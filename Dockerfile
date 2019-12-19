FROM node:12.14.0-alpine

WORKDIR /app

ENV HOST "0.0.0.0"

RUN apk add --no-cache --update tzdata && \
    apk upgrade --no-cache && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/* && \
    npm install -g npm yarn

COPY . /app

RUN yarn install

EXPOSE 8080
