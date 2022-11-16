FROM ruby:2.7.6-alpine3.15

WORKDIR /myapp
COPY Gemfile* /myapp/

RUN apk update && \
    apk upgrade && \
    apk add --no-cache linux-headers libxml2-dev make gcc libc-dev nodejs yarn tzdata bash mysql-dev && \
    apk add --no-cache -t .build-packages --no-cache build-base curl-dev mysql-client && \
    bundle install -j4 && \
    apk del --purge .build-packages

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
