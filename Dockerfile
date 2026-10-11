FROM forumi0721/alpine-base:latest

LABEL maintainer="forumi0721@gmail.com"

COPY local/. /usr/local/

RUN ["docker-build"]

ENTRYPOINT ["docker-run"]

EXPOSE 2121/tcp 62100-62199/tcp 8000/tcp 2049/tcp 2020/tcp 8080/tcp

