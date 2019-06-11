#FROM hypriot/rpi-node
#FROM arm32v7/node
#FROM node:8.11.2-alpine

FROM armhf/node


WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

RUN /bin/sh

COPY . .

RUN npm run build
RUN npm install -g @angular/cli

EXPOSE 4200

CMD ng serve --host 0.0.0.0 --port 4200 --disable-host-check
