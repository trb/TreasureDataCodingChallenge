#!/bin/bash

bundle config set path '/gems'
bundle install
bundle exec rake db:migrate