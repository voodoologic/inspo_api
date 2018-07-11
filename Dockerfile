FROM ubuntu:16.04
MAINTAINER Doug Headley <dougheadley@pm.me>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential curl zlib1g-dev zlib1g zlibc openssl libssl-dev libreadline-dev

ENV CONFIGURE_OPTS --disable-install-rdoc

ENV RUBY_VERSION=2.5.1
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.5/ruby-${RUBY_VERSION}.tar.gz && \
    tar -zxvf ruby-${RUBY_VERSION}.tar.gz && \
    cd ruby-${RUBY_VERSION} && \
    ./configure --disable-install-doc --enable-shared && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-${RUBY_VERSION} ruby-${RUBY_VERSION}.tar.gz && \
    echo 'gem: --no-document' > /usr/local/etc/gemrcdoc

LABEL container=hatorade-rails
# We need postgres for pg gem
RUN apt-get install -y \
    git-core postgresql-client libpq-dev\
    libssl-dev libreadline-dev nodejs curl

# Install memcached
RUN apt-get clean

# Clean up downloaded packages
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler

WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

ADD ./ /opt/inspo_rails

WORKDIR /opt/inspo_rails

# RUN chmod 755 /hatorade

ENV RAILS_ENV development

ENV QUEUE 6
ENV COUNT 2
ENV PUMA_WORKERS 2
ENV HOME /root
