FROM ruby:2.5.1
MAINTAINER kirill.borodylin@gmail.com
# Install essentials

RUN apt-get update && apt-get install -y wget curl


RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

 