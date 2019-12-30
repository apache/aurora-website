#!/bin/bash

apt-get update

apt-get install -y \
    build-essential \
    git \
    ruby2.0 \
    ruby2.0-dev \
    subversion \
    zlib1g-dev \
    unzip

gem2.0 install bundler
cd /vagrant
bundle install
rake2.0
