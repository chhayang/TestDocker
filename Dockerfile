FROM brereton/rpi3node

RUN apt-get update && \
    apt-get -qy install	git \
		nano

RUN git clone https://github.com/chhayang/TestDocker.git TestDocker

WORKDIR TestDocker
RUN npm install
CMD ["npm","start"]
