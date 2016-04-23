##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "AppleIDiskServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-02
version "0.2"
description "With MobileMe iDisk, it.s easy to store, access, and share files online. You have plenty of storage space . even large files are no problem. Just add the files you need to your iDisk, and whatever you upload will be there for you to download using a web browser on any computer or using the iDisk app for iPhone, iPad, or iPod touch."
website "http://www.apple.com/mobileme/features/idisk.html"

# ShodanHQ results as at 2011-04-02 #
# 286 for AppleIDiskServer

matches [

	# HTTP Server header
	{ :regexp=>/^AppleIDiskServer/, :search=>"headers[server]" },

	# HTTP Server header # Version Detection 
	{ :version=>/^AppleIDiskServer[\.|-][A-Z\d]+$/, :search=>"headers[server]" },

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	if @headers["server"] =~ /^AppleIDiskServer[\.|-][A-Z\d]+$/

		# WWW Authenticate
		m << { :name=>"WWW Authenticate" } if @headers["www-authenticate"] =~ /Basic realm="me\.com"/

		# Account Detection # X-dmUser
		m << { :account=>@headers["x-dmuser"] } unless @headers["x-dmuser"].nil?
	end

	# Return passive matches
	m

end

end

