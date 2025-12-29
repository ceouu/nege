FROM node:alpine3.20

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN apk update && apk upgrade && \
    apk add --no-cache openssl curl gcompat iproute2 coreutils bash

RUN chmod +x index.js

EXPOSE 3000/tcp

CMD ["node", "index.js"]
