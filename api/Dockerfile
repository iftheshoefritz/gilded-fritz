FROM ruby:2.5

ENV INSTALL_PATH /api
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
RUN bundle install

COPY gilded_server.rb gilded_server.rb

CMD ruby gilded_server.rb
