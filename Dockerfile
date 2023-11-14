# # syntax = docker/dockerfile:1

# # Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
# ARG RUBY_VERSION=3.2.1
# FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# # Rails app lives here
# WORKDIR /rails

# # Set production environment
# ENV RAILS_ENV="production" \
#     BUNDLE_DEPLOYMENT="1" \
#     BUNDLE_PATH="/usr/local/bundle" \
#     BUNDLE_WITHOUT="development"


# # Throw-away build stage to reduce size of final image
# FROM base as build

# # Install packages needed to build gems
# RUN apt-get update -qq && \
#     apt-get install --no-install-recommends -y build-essential default-libmysqlclient-dev git libvips pkg-config

# # Install application gems
# COPY Gemfile Gemfile.lock ./
# RUN bundle install && \
#     rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
#     bundle exec bootsnap precompile --gemfile

# # Copy application code
# COPY . .

# # Precompile bootsnap code for faster boot times
# RUN bundle exec bootsnap precompile app/ lib/


# # Final stage for app image
# FROM base

# # Install packages needed for deployment
# RUN apt-get update -qq && \
#     apt-get install --no-install-recommends -y curl default-mysql-client libvips && \
#     rm -rf /var/lib/apt/lists /var/cache/apt/archives

# # Copy built artifacts: gems, application
# COPY --from=build /usr/local/bundle /usr/local/bundle
# COPY --from=build /rails /rails

# # パーミッションエラーになるのでコメントアウト
# # Run and own only the runtime files as a non-root user for security
# # RUN useradd rails --create-home --shell /bin/bash && \
# #     chown -R rails:rails db log storage tmp
# # USER rails:rails

# # Entrypoint prepares the database.
# ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# # Start the server by default, this can be overwritten at runtime
# EXPOSE 3000
# CMD ["./bin/rails", "server"]

FROM ruby:3.2.1
ENV LANG C.UTF-8
ENV APP_ROOT /app
WORKDIR $APP_ROOT

# -y	問い合わせがあった場合はすべて「y」と答える
RUN apt-get update -qq && apt-get install -y vim && apt-get install -y nodejs npm

ENV YARN_VERSION 1.22.19

# install yarn
RUN curl -L --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" > /tmp/yarn.tar.gz && \
  tar -xzf /tmp/yarn.tar.gz -C /opt && \
  ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn && \
  ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg && \
  rm /tmp/yarn.tar.gz

# https://qiita.com/m-dove/items/a60b1a09d32299d215bb
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

ENV BUNDLER_VERSION 2.4.6
RUN npm install -g n && n 20.0.0
RUN bundle install

COPY . $APP_ROOT
 
EXPOSE 8080
 
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]