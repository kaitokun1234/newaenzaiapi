FROM ruby:3.1.2

RUN gem install sinatra
RUN gem install eth
WORKDIR /
COPY . /
RUN sudo apt-get install imagemagick libmagick++-dev
RUN bundle install

EXPOSE 4567
CMD ["bundle", "exec", "ruby", "./app.rb"]