# docker-ruby

This is simply a Dockerfile to build a minimal Docker container to run your Ruby
app. It uses [phusion/baseimage:0.9.15](https://hub.docker.com/r/phusion/baseimage) as base image.

The container built using this Dockerfile  has following goodies:

- Git, wget and other packages required to build Ruby
- Ruby 2.3.0 installed to /usr/local
- Bundler and Pry 

It is a perfect as base image and playground to hack around your Ruby apps.

## Usage

Check Ruby version 

    docker run -it outware/ruby bash
    $ ruby -v ; which ruby

To run Ruby console or Pry

    docker run -it outware/ruby irb
    docker run -it outware/ruby pry
