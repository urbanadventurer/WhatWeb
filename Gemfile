##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
source 'https://rubygems.org'

# IP Address Ranges
gem 'ipaddr'

# IDN Domains
gem 'addressable'

# JSON logging
gem 'json'

# MongoDB logging - optional
group :mongo do
  #gem 'mongo'
  #gem 'rchardet'
end

# Character set detection - optional
group :rchardet do
  #gem 'rchardet'
end

# Development dependencies required for tests
group :test do
  gem 'rake'
  gem 'minitest'
  gem 'rubocop'
  gem 'rdoc'
  gem 'bundler-audit'
  gem 'simplecov', require: false
end

# Needed for debugging WhatWeb
group :development do
  gem 'pry', :require => false
  gem 'rb-readline', :require => false # needed by pry on some systems
end
