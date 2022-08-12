FROM ruby:2.7

ENV WHATWEB_VERSION master
RUN git clone --branch $WHATWEB_VERSION https://github.com/urbanadventurer/WhatWeb.git /src/whatweb

RUN cd /src/whatweb && bundle install

WORKDIR /src/whatweb

ENTRYPOINT ["/src/whatweb/whatweb"]
