FROM ruby:2.5

WORKDIR /usr/src/app

ADD . ./
RUN bundle install
RUN make install

ENTRYPOINT ["./whatweb"]
CMD ["--help"]
