##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Java"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-01-28
  # v0.2 # 2011-03-06 # Updated OS detection. 
  "Andrew Horton", # v0.3 # 2021-02-28 # Added File Extension, convereted passive block to matches array
]
version "0.3"
description "Java allows you to play online games, chat with people around the world, calculate your mortgage interest, and view images in 3D, just to name a few. It's also integral to the intranet applications and other e-business solutions that are the foundation of corporate computing."
website "http://www.java.com/"

# ShodanHQ results as at 2011-01-28 #
#	10,814 for X-Powered-By: JSP
#	153,488 for JSESSIONID
#	571 for java.vendor=Sun Microsystems Inc
#	47 for java.vendor=IBM Corporation
#	118 for "x-powered-by" JSP JRE
#	13950 for server JAVA

# Matches #
matches [

	# JSESSIONID Cookie
	{ :name=>"JSESSIONID Cookie", :search=>"headers[set-cookie]", :regexp => /JSESSIONID=[^;]{0,32};[\s]?path=\//i},

	# X-Powered-By # JSP Version Detection
	{ :name=>"X-Powered-By # JSP Version Detection", :search=>"headers[x-powered-by]", :version => /JSP\/([\d\.]+)/},

	# X-Powered-By # Servlet Version Detection
	{ :name=>"X-Powered-By # Servlet Version Detection", :search=>"headers[x-powered-by]", :string => /(Servlet\/[\d\.]+)/i},

	# X-Powered-By # JRE Version Detection
	{ :name=>"X-Powered-By # JRE Version Detection", :search=>"headers[x-powered-by]", :string => /(JRE\/[\d\.\-\_]+)/},

	# Server # Version Detection
	{ :name=>"Server # Version Detection", :search=>"headers[server]", :version => /java\/([\d\.\-\_]+)/},

	# Server # JDK Version Detection
	{ :name=>"Server # Version Detection", :search=>"headers[server]", :string => /(JDK [\d\.\-\_]+)/},

	# Servlet-Engine
	{ :name=>"Servlet-Engine # JSP Version Detection", :search=>"headers[servlet-engine]", :string => /\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/, :offset=>0},
	{ :name=>"Servlet-Engine # Servlet Version Detection", :search=>"headers[servlet-engine]", :string => /\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/, :offset=>1},
	{ :name=>"Servlet-Engine # Version Detection", :search=>"headers[servlet-engine]", :version => /\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/, :offset=>2},
	{ :name=>"Servlet-Engine # OS Detection", :search=>"headers[servlet-engine]", :os => /\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/, :offset=>3},

	# File Extension
	{ :name=>"File extension", :regexp=>/^(jsp|jpx|wss|do)$/, :search=>"uri.extension" }
]


end

