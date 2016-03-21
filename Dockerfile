FROM phusion/baseimage:0.9.15

MAINTAINER Will Djingga <william.djingga@outware.com.au>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install packages for building ruby
RUN apt-get update && apt-get install -y \ 
      build-essential \
      wget \
      git \
      zlib1g-dev \
      libssl-dev \
      libreadline-dev \
      libyaml-dev \
      libxml2-dev \
      libxslt-dev

# Install ruby-install
RUN cd /tmp &&\
  wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz &&\
  tar -xzvf ruby-install-0.6.0.tar.gz &&\
  cd ruby-install-0.6.0/ &&\
  make install

# Install MRI Ruby
RUN ruby-install ruby 2.3.0

# Add Ruby binaries to $PATH
ENV PATH /opt/rubies/ruby-2.3.0/bin:$PATH

# Add options to gemrc
RUN echo "install: --no-document\nupdate: --no-document" > ~/.gemrc

# Install bundler and pry
RUN gem install \
  bundler \
  pry

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
