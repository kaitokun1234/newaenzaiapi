FROM ruby:3.1.2

RUN gem install sinatra
RUN gem install eth
WORKDIR /
COPY . /
RUN bundle install

EXPOSE 4567
CMD ["bundle", "exec", "ruby", "./app.rb"]