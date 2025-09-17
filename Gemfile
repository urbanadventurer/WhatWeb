##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
source 'https://rubygems.org'

# IP Address Ranges
gem 'ipaddr'

# IDN Domains
gem 'addressable'

# JSON logging
gem 'json'

# CLI argument parsing
gem 'getoptlong', '~> 0.1'

# asynchronous DNS
gem 'resolv-replace', '~> 0.1'

# MongoDB logging - optional
# To use: bundle install --with mongo
group :mongo, optional: true do
  gem 'mongo'
  gem 'rchardet'
end

# Character set detection - optional
# To use: bundle install --with rchardet
group :rchardet, optional: true do
  gem 'rchardet'
end

# Development dependencies required for tests
group :test do
  gem 'rake'
  # Support both older and newer Ruby versions
  gem 'minitest', '>= 5.14.2', '< 6.0'
  gem 'rubocop', '~> 1.0'
  gem 'rdoc'
  gem 'bundler-audit'
  gem 'simplecov', require: false
end

# Needed for debugging WhatWeb
group :development do
  gem 'pry', :require => false
  gem 'rb-readline', :require => false # needed by pry on some systems
end
