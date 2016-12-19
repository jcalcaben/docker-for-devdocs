FROM ruby:2.2.5

RUN apt-get update \
  && apt-get install -y \
    node \
    python-pygments \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN gem install \
  github-pages:83\
  jekyll:3.1.6 \
  kramdown \
  rdiscount \
  RedCloth \
  pygments.rb \
  json \
  rouge \
  jekyll-watch \
  jekyll-last-modified-at:0.3.4 \
  jekyll-redirect-from:~> 0.8.0

VOLUME /src
EXPOSE 4000

WORKDIR /src
