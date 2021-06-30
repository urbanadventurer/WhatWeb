FROM ruby:alpine
WORKDIR /root/

ADD lib ./lib/
ADD plugins ./plugins/
ADD my-plugins ./my-plugins/
ADD Gemfile ./
ADD whatweb ./

RUN bundle install

ENTRYPOINT ["./whatweb"]
