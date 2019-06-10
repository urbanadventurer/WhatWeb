##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Web-Crossing-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2012-01-06
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
]
version "0.2"
description ""
website "http://bayspire.com/"
# ShodanHQ results as at 2011-01-06 #
# 116 for Web Crossing(r)

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Web Crossing\/([^\s]+)$/ },
{ :search=>"headers[server]", :version=>/^Web Crossing\(r\) [^\s]+-v([\d\.]+) built/ },

# Set-Cookie # webxSess
{ :search=>"headers[set-cookie]", :regexp=>/webxSess=[\d]+\.[^\s]+;/ },

]

end

