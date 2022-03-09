FROM python:3.7-alpine
MAINTAINER Jelle Scholtalbers <j.scholtalbers@gmail.com>
LABEL description="This image can be used to build your mkdocs site"
RUN apk add --no-cache rsync openssh git build-base
RUN pip install --no-cache-dir mkdocs mkdocs-markdownextradata-plugin