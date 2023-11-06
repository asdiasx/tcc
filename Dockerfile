ARG RUBY_VERSION=3.2.0
FROM ruby:$RUBY_VERSION

RUN apt -y update -qq && apt install -y \
  apt-utils \
  build-essential \
  default-libmysqlclient-dev \
  curl \
  npm


run curl -SLO https://deb.nodesource.com/nsolid_setup_deb.sh
run chmod 500 nsolid_setup_deb.sh
run ./nsolid_setup_deb.sh 18
run apt install nodejs -y


RUN git config --global init.defaultBranch main

RUN npm -g install yarn

RUN gem update --system
RUN gem install bundler

ARG RAILS_VERSION=7.0.7.2
RUN gem install rails -v=$RAILS_VERSION

WORKDIR /usr/src/peeper