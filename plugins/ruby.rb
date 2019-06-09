##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Ruby"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-26
  # v0.2 # 2011-05-24 # Added WEBrick detection. 
  "Andrew Horton", # v0.3 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.3"
description "Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write."
website "http://www.ruby-lang.org/"

# ShodanHQ results as at 2011-05-24 #
# 22,172 for server: ruby
#    822 for WEBrick

matches [
	
	# Ruby Server 
	{ :regexp=>/Ruby/, :search=>"headers[server]" },

	# Server # Version Detection
	{ :version=>/Ruby\/([^\s^\/^\(]+)/, :search=>"headers[server]" },

	# WEBrick Server 
	{ :regexp=>/^WEBrick/, :search=>"headers[server]" },

	# WEBrick Server # Version Detection
	{ :version=>/^(WEBrick\/[\d\.]+) \(Ruby\/[\d\.]+\/[\d]{4}-[\d]{2}-[\d]{2}\)/, :search=>"headers[server]" },

	# WEBrick Server # Ruby Version Detection
	{ :version=>/^WEBrick\/[\d\.]+ \(Ruby\/([\d\.]+)\/[\d]{4}-[\d]{2}-[\d]{2}\)/, :search=>"headers[server]" },

]

end

