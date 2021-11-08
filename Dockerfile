FROM ruby:3.0.1

ENV APP_PATH /home/project19

RUN gem install bundler -v 2.2.15
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY . ./

RUN bundle lock --add-platform x86_64-linux && \
  bundle config set clean 'true' && \
  bundle config set deployment 'true' && \
  bundle config set frozen 'true' && \
  bundle config set without 'development test' && \
  bundle install --jobs 16

CMD ["bundle", "exec", "puma", "-p", "80"]
