#FROM node:16

#RUN mkdir -p /opt/christmas

# Create app directory
#WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#COPY package*.json ./

#RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
#COPY . .

#EXPOSE 3000
#CMD [ "node", "app.js" ]

FROM node
MAINTAINER Rebecca Leifer <rebecca.leifer15@gmail.com>

# install deps
ADD package.json /tmp/package.json
RUN cd /tmp && npm install

# Copy deps
RUN mkdir -p /opt/christmas && cp -a /tmp/node_modules /opt/christmas

# Setup workdir
WORKDIR /opt/christmas
COPY . /opt/christmas

# run
EXPOSE 3000
CMD ["node", "app.js"]