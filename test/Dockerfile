FROM debian:jessie

ENV NODE_ENV dev

# Create the app source dir
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get -y update
RUN apt-get install -y build-essential
RUN apt-get install -y wget

# Time to install Node.JS version 8
RUN wget -O- https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Install the app dependencies
COPY package.json /usr/src/app/
RUN npm install --no-bin-links

# Bundle app src
COPY . /usr/src/app

# Let the docker daemon bind to port 4224
# This may change based on how we write the app, don't forget to change it

CMD ["npm", "test"]
