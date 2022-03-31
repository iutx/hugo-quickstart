FROM debian:unstable-slim AS build
LABEL maintainer="iutx<root@viper.run>"

WORKDIR /src

RUN apt-get update && \
    apt-get install -y hugo

COPY . .

RUN hugo -D

FROM nginx
LABEL maintainer="iutx<root@viper.run>"

COPY --from=build /src/public /usr/share/nginx/html
