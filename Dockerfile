FROM ruby:2.2.5

RUN apt-get update \
  && apt-get install -y \
    node \
    python-pygments \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN gem install \
  github-pages:83\
  jekyll \
  jekyll-redirect-from \
  kramdown \
  rdiscount \
  jekyll-last-modified-at \
  RedCloth \
  pygments.rb \
  json \
  rouge \
  jekyll-watch:1.4.0 \
  therubyracer

VOLUME /src
EXPOSE 4000

WORKDIR /src