##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebObjects" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-19
version "0.1"
description "WebObjects is a Java web application server from Apple Inc., and a web application framework that runs on the server."
website "http://www.apple.com/support/webobjects/"

# ShodanHQ results as at 2011-05-19 #
# 141 for "200 Apple WebObjects"
# 143 for x-webobjects-loadaverage

# Google results as at 2011-05-19 #
# 88 for ext:woa

# Dorks #
dorks [
'ext:woa'
]



# Passive #
def passive
	m=[]

	# x-webobjects-loadaverage
	m << { :name=>"x-webobjects-loadaverage" } unless @headers["x-webobjects-loadaverage"].nil?

	# x-apple-application-instance
	m << { :name=>"x-apple-application-instance" } unless @headers["x-apple-application-instance"].nil?

	# x-apple-application-site
	m << { :name=>"x-apple-application-site" } unless @headers["x-apple-application-site"].nil?

	# x-webobjects-servlet
	m << { :name=>"x-webobjects-servlet" } unless @headers["x-webobjects-servlet"].nil?

	# x-webobjects-server-name
	m << { :name=>"x-webobjects-server-name" } unless @headers["x-webobjects-server-name"].nil?

	# x-webobjects-request-method
	m << { :name=>"x-webobjects-request-method" } unless @headers["x-webobjects-request-method"].nil?

	# x-webobjects-adaptor-version
	m << { :name=>"x-webobjects-adaptor-version" } unless @headers["x-webobjects-request-method"].nil?

	# x-webobjects-customenv
	m << { :name=>"x-webobjects-customenv" } unless @headers["x-webobjects-customenv"].nil?

	# Return passive matches
	m
end

end

# This plugin could be improved by:
#	checking for instances of "/cgi-bin/WebObjects/"
#	checking for the "woa" file extension

