##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Apache-Cocoon"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-02-24
  "Andrew Horton", # v0.2 # 2016-04-19 # Replaced passive function with match for server header. 
]
version "0.2"
description "Apache Cocoon is a Spring-based framework (since version 2.2 of Cocoon) built around the concepts of separation of concerns and component-based development."
website "http://cocoon.apache.org/"

# ShodanHQ results as at 2011-02-24 #
# 707 for X-Cocoon-Version

matches [

	{ :version=>/^(.*)$/ ,:search=>"headers[x-cocoon-version]" },

]

end
