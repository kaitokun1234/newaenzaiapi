FROM ruby:2.7

RUN gem install sinatra
WORKDIR /code
COPY . /code
RUN bundle install

CMD ["bundle", "exec", "ruby", "./app.rb"]
EXPOSE 8080