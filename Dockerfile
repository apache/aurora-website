FROM ubuntu:bionic

# Port on which Middleman shows live preview
EXPOSE 4567

# Add RVM ppa
RUN apt-get update && apt-get -y install software-properties-common && apt-add-repository -y ppa:rael-gc/rvm
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install curl git rvm unzip tzdata

# Change shell to be able to use RVM
SHELL ["/bin/bash", "--login", "-c"]

# Install Ruby 2.0.0 as this version is compatible with the middelman version we use
RUN rvm install 2.0.0 && rvm use 2.0.0 --default

# Install Middleman through bundle
COPY Gemfile Gemfile.lock /middleman/
RUN pushd /middleman && gem install bundler -v 1.7.3 && bundle install && popd

WORKDIR /website
ENTRYPOINT /bin/bash --login