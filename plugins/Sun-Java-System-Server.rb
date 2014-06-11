##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-30 #
# Updated version detection
# Added Application Server version detection
##
Plugin.define "Sun-Java-System-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.2"
description "Sun Java System Web/Proxy Server. - homepage: http://developers.sun.com/appserver/"

# ShodanHQ results as at 2010-10-23 #
# 2722 results for Server: Sun-Java-System-Web-Server
# 252 results for Proxy-agent: Sun-Java-System-Web-Proxy-Server
# 202 for Proxy-agent: Sun-Java-System-Web-Server



# Passive #
def passive
	m=[]

	# Version Detection # Proxy-Agent
	if @headers["proxy-agent"].to_s =~ /^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/
		m << { :version=>@headers["proxy-agent"].scan(/^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/).flatten, :module=>"Proxy Server" }
	end

	# Version Detection # Web Server
	if @headers["server"].to_s =~ /^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/
		m << { :version=>@headers["server"].scan(/^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/).flatten, :module=>"Web Server" }
	end

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

