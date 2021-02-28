##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Perl"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-26
  # v0.2 # Added content-type application/perl match. 
  "Andrew Horton" # v0.3 #2021-02-28 # added file extension detections and move passive block to matches

]
version "0.3"
description "Perl is a highly capable, feature-rich programming language with over 22 years of development."
website "http://www.perl.org/"

# About 309934 ShodanHQ results for "server: perl/v" @ 2010-10-26

# Matches #
matches [

	# HTTP Server Header
	{ :name=>"HTTP Server Header", :version=>/[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i, :search=>"headers[server]" },

	# HTTP Content-Type Header
	{ :name=>"HTTP Content-Type Header", :regexp=>/application\/perl/i, :search=>"headers[content-type]" },

	# File Extension
	{ :name=>"File extension", :regexp=>/^(pl)$/, :search=>"uri.extension" }

]


end

