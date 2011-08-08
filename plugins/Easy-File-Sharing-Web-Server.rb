##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Easy-File-Sharing-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "Easy File Sharing Web Server is a file sharing software that allows visitors to upload/download files easily through a Web Browser - Homepage: http://www.sharing-file.com/"

# ShodanHQ results as at 2011-04-08 #
# 656 for Easy File Sharing Web Server

# Examples #
examples %w|
93.97.48.27
81.83.13.138
124.117.219.6
24.118.54.175
24.199.230.138
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Easy File Sharing Web Server v(.+)$/) } if @headers["server"] =~ /^Easy File Sharing Web Server v(.+)$/

	# Return passive matches
	m
end

end

