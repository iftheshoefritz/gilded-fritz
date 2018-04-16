FROM ruby:2.5

ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
RUN bundle install

CMD ruby gilded_rose_distributed.rb
