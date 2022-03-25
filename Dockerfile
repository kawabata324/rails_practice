FROM ruby:2.7.5

RUN apt-get update -qq \
    && apt-get install -y nodejs postgresql-client
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn

RUN mkdir /app

COPY Gemfile /app
COPY Gemfile.lock /app

WORKDIR /app

RUN gem install bundler && bundle install