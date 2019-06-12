#FROM hypriot/rpi-node
#FROM arm32v7/node
#FROM node:8.11.2-alpine
#FROM armhf/node
#FROM brereton/rpi3node
FROM arm32v7/node

USER root
#RUN wget https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-armv7l.tar.xz
#RUN tar -xf node*.tar.xz
#RUN cd node-v10.16.0-linux-armv7l
#RUN sudo cp -R * /usr/local/
RUN apt-get update 

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -  

RUN  apt-get install -y nodejs 

RUN npm -v
RUN node -v

WORKDIR /usr/src/app

COPY package*.json ./


RUN npm install


RUN /bin/sh

COPY . .

RUN npm run build
RUN npm install -g @angular/cli

EXPOSE 4200

CMD ng serve --host 0.0.0.0 --port 4200 --disable-host-check
