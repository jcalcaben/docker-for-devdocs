FROM ruby:2.2.5

#RUN apt-get update \
#  && apt-get install -y \
#    node \
#    python-pygments \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/

RUN gem install \
#  colorator:0.1\
  github-pages:83\
#  jekyll:3.1.6 \
#  kramdown \
#  rdiscount \
#  RedCloth \
  pygments.rb \
#  json \
#  rouge \
#  jekyll-watch \
  jekyll-last-modified-at:0.3.4 \
#  jekyll-redirect-from \
#  minitest
  algoliasearch-jekyll:1.0.0.beta.pre.1

VOLUME /src
EXPOSE 4000

WORKDIR /src
