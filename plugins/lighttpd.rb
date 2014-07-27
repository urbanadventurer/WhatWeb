##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-06 #
# Updated OS detection
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "lighttpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.3"
description "Lightweight open-source web server."
website "http://www.lighttpd.net/"

# ShodanHQ results as at 2010-10-26 #
# 124,972 for "server: lighttpd"



# Passive #
def passive
	m=[]

	# Version Detection # Server HTTP header
	m << { :version=>@headers["server"].to_s.scan(/^[\s]*lighttpd\/([^\s^\r^\n]+)/).flatten } if @headers["server"].to_s =~ /^[\s]*lighttpd\/([^\s^\r^\n]+)/

	# OS Detection # Server HTTP header
	m << { :os=>@headers["server"].scan(/^[\s]*lighttpd \(([^\)]+)\)/).flatten } if @headers["server"] =~ /^[\s]*lighttpd \(([^\)]+)\)/

	# Return passive results
	m

end

end

