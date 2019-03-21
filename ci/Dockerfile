FROM ruby:2.6.1

ENV RABBITMQ_HOSTS rabbitmq
ENV RABBITMQ_USER guest
ENV RABBITMQ_PASSWORD guest
ENV RABBITMQ_EXCHANGE published_documents
ENV REDIS_HOST redis

ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/
COPY Gemfile.lock $APP_HOME/
RUN bundle install

COPY . $APP_HOME/

ENTRYPOINT ["bundle", "exec", "rake", "spec"]
