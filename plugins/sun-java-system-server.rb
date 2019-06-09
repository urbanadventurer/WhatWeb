##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Sun-Java-System-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-23
  # v0.2 # 2011-01-30 # Updated version detection. Added Application Server version detection. 
  "Andrew Horton", # v0.3 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.3"
description "Sun Java System Web/Proxy Server."
website "http://developers.sun.com/appserver/"

# ShodanHQ results as at 2010-10-23 #
# 2722 results for Server: Sun-Java-System-Web-Server
# 252 results for Proxy-agent: Sun-Java-System-Web-Proxy-Server
# 202 for Proxy-agent: Sun-Java-System-Web-Server

matches [

	# Application Server
	{ :regexp=>/^[\s]*Sun[\-\ ]{1}Java[\-\ ]{1}System[\/\ ]{1}Application[\-\ ]{1}Server/, :search=>"headers[server]" },

	# Version Detection # Proxy-Agent
	{ :version=>/^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/, :search=>"headers[proxy-agent]", :module=>"Proxy Server" },

	# Version Detection # Web Server
	{ :version=>/^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/, :search=>"headers[server]", :module=>"Web Server" },
]

# Passive #
passive do
	m=[]

	# Version Detection # Application Server
	if @headers["server"].to_s =~ /^[\s]*Sun[\-\ ]{1}Java[\-\ ]{1}System[\/\ ]{1}Application[\-\ ]{1}Server/
		if @headers["server"].to_s =~ /^[\s]*Sun[\-\ ]{1}Java[\-\ ]{1}System[\/\ ]{1}Application[\-\ ]{1}Server ([\d\._]+)/
			m << { :version=>@headers["server"].scan(/^[\s]*Sun[\-\ ]{1}Java[\-\ ]{1}System[\/\ ]{1}Application[\-\ ]{1}Server ([\d\._]+)/).flatten, :module=>"Application Server" }
		else
			m << { :name=>"HTTP server header", :module=>"Application Server" }
		end

	end

	# Return passive results
	m
end

end

