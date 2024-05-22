FROM ruby:3.3.1-alpine as base

RUN apk -u add build-base git mysql-dev nodejs sqlite-dev tzdata

FROM base AS builder

RUN mkdir /build

COPY Gemfile /build

WORKDIR /build

RUN bundle config set path /gems && bundle install -j $(nproc)

FROM base

COPY --from=builder /gems /gems

WORKDIR /app

EXPOSE 3000

RUN bundle config set path /gems

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["start"]



