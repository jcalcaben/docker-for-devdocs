FROM ruby:2.4.3

RUN gem install \
  github-pages:167\
  jekyll:3.6.2 \
  algoliasearch-jekyll:1.0.0.beta.pre.1\
  html-proofer:3.7.6\
  launchy\
  minitest:5.11.1

#  specific_install

ENV LANG C.UTF-8

# RUN git clone https://github.com/magento-devdocs/devdocs-theme.git
# RUN cd devdocs-theme && gem build devdocs.gemspec && gem install --local ./devdocs-0.0.1.gem

# RUN gem specific_install https://github.com/magento-devdocs/devdocs-theme.git -b master

VOLUME /src
EXPOSE 4000

WORKDIR /src
