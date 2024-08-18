# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
FROM ruby:3.3.4

ARG RUNNER_GID=1000
ARG RUNNER_UID=1000

# Setup default directory
RUN mkdir /var/source
WORKDIR /var/source

# Install rails and dependencies
RUN gem install rails bundler

COPY bin/docker_entrypoint.sh /entrypoint.sh

# Change runner id to make system
RUN groupadd --force -g $RUNNER_GID runner
RUN useradd -ms /bin/bash --no-user-group -g $RUNNER_GID -u $RUNNER_UID runner
RUN chown -R runner:runner /var/source
RUN chown -R runner:runner /usr/local/bundle

# Switch to the runner user
USER runner

ENTRYPOINT [ "/entrypoint.sh" ]
