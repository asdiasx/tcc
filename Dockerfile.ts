FROM node

RUN apt-get update -qq && apt-get install -y \
  apt-utils \
  build-essential

RUN npm install -g vue
RUN npm install -g @vue/cli

WORKDIR /usr/src/client
