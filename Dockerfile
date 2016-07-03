FROM ruby:2.3-alpine

MAINTAINER João Pedro Evangelista <joaoevangelista@protonmail.com>

ENV RAILS_ENV="production"
RUN mkdir -p /app && apk update && apk add git
WORKDIR /app
ADD ./ /app
RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \
    postgresql-dev libc-dev linux-headers git && \
    gem install bundler && \
    bundle install --without development test && \
    apk del build-dependencies
EXPOSE 3000

ENTRYPOINT ["/bin/bundle exec rails s "-p 3000 -b '0.0.0.0']
