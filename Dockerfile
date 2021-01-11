FROM ruby:2.6.3-slim
RUN apt-get update -qq && apt-get install -y build-essential sqlite3 libsqlite3-dev nodejs libpq-dev \
    && apt-get clean autoclean \
    && apt-get autoremove -y
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install 
COPY . /app
CMD bundle exec rails s -p 3000 -b '0.0.0.0'
