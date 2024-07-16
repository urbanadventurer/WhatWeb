FROM ruby:2.4

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile ./

RUN bundle install

COPY . .

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

CMD ["--help"]

