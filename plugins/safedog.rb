##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name 'Safedog'
authors [
  "Brendan Coles <bcoles@gmail.com>" # 2017-12-03
]
version '0.1'
description 'Safedog WAF'
website ''

# ShodanHQ results as at 2017-12-03 #
# 43,686 for Set-Cookie safedog-flow-item=
# 29,982 for X-Powered-By: WAF/2.0
# 7,179 for Server: Safedog -IIS
# 191 for Server: Safedog/4.0.0

# 200,000 websites @ https://publicwww.com/websites/%22Powered-By%3A+WAF%2F2.0%22/

matches [
  { :name=>'Server Header',
    :regexp=>/^Safedog/,
    :search=>'headers[server]' },

  { :name=>'Server Header Version Detection',
    :version=>%r{^Safedog/([\d\.]+)},
    :search=>'headers[server]' },

  { :name=>'X-Powered-By Header',
    :regexp=>%r{^WAF/2\.0},
    :search=>'headers[x-powered-by]' },

  { :name=>'safedog-flow-item Cookie',
    :text=>'safedog-flow-item=',
    :search=>'headers[set-cookie]' }
]

end

