FROM ubuntu:20.04

# Replace sh with bash. This is just to make the rest 
# of this script a little bit easier to write.
RUN rm /bin/sh \
  && ln -s /bin/bash /bin/sh

# Update system dependencies and install a couple things we need.
# A lot of these are required by various native dependencies which compile 
# during an npm install. 
RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y curl g++ make git

# Install Meteor
WORKDIR /meteor
RUN curl -sL https://install.meteor.com?release=1.8 -o install_meteor.sh \
  && sh install_meteor.sh \
  && rm -rf /meteor

# During the meteor build process, some dependencies require the node/npm 
# binaries to be available. We install that here using nvm
WORKDIR /node
ENV NODE_VERSION 8.17.0
ENV NVM_DIR /usr/local/nvm
RUN mkdir -p $NVM_DIR
RUN curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh -o install_nvm.sh \
  && sh install_nvm.sh \
  && source $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default \
  && rm -rf /node

# Override the Node memory allocation limit for large projects.
ENV TOOL_NODE_FLAGS --max-old-space-size=8192

# On build commands.
# This just saves you space in the Dockerfile you need to write for your app. 

# Copy the app into the docker container.
ONBUILD WORKDIR /app
ONBUILD COPY ./. .

# Install npm dependencies and build the app
ONBUILD RUN meteor npm i --production \
  && meteor build ../build --allow-superuser --directory \
  && rm -rf /app

# Run another npm i inside there for good measure
ONBUILD WORKDIR /build/bundle/programs/server
ONBUILD RUN meteor npm i --production

# Expose 80 and run main.js. Right now this isn't configurable, but I might 
# add that capability in the future.
ONBUILD WORKDIR /build/bundle
ONBUILD EXPOSE 80
ONBUILD ENV PORT 80
ONBUILD CMD [ "meteor", "node", "main.js" ]
