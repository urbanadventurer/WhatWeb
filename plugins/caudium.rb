##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Caudium"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-08-02
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved 2 patterns from passive function to matches[]. 
]
version "0.2"
description "Caudium is the name of a GPL-ed (free for commercial and personal use) web server written in Pike and in C. It is originally based on the Roxen Challenger 1.3 code base."
website "http://www.caudium.net/"
# More info: http://www.http-stats.com/X-Got-Fish

# About 209 ShodanHQ results for Server: Caudium @ 2011-08-02

matches [
# Version Detection # HTTP Server Header
{ :version => /Caudium\/([\d\.]+)/,
  :search => "headers[server]" },

# Catch-All # HTTP Server Header
{ :name => "HTTP Server Header",
  :regexp => /Caudium/,
  :search => "headers[server]" },

# Pike Version Detection # HTTP X-Got-Fish Header
{ :module => /(Pike v[\d\.]+ release [\d]+)$/,
  :search => "headers[x-got-fish]" }
]

end

