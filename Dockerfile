# そのうち実行する
FROM ruby:2.6.2

ENV APP_DIR /yugenjigo_app

RUN apt-get -y update && \
    apt-get install build-essential \
                    libpq-dev \
                    nodejs
RUN gem install bundle
RUN mkdir /app

WORKDIR $APP_DIR

ADD ./Gemfile $APP_DIR/Gemfile
ADD ./Gemfile.lock $APP_DIR/Gemfile.lock

RUN bundle install
ADD . $APP_DIR
