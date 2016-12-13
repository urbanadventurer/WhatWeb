##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Kyocera-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.2"
description "Web interface for Kyocera printers. Some models have built in fax and scanner capabilities."
website "http://global.kyocera.com/"

# ShodanHQ results as at 2011-05-31 #
# 4,783 for JC-HTTPD
# 2,181 for NetworkScanner
# 1,943 for KM-httpd
# 1,324 for KM-MFP-http

matches [

	# HTTP Server Detection
	{ :regexp=>/^KM-MFP-http/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^KM-MFP-http\/V([\d\.]+)$/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header # KM-httpd
	{ :version=>/^KM-httpd\/([\d\.]+)$/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header # JC-HTTPD
	{ :version=>/^JC-HTTPD\/([\d\.]+)$/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header # NetworkScanner WebServer Ver
	{ :string=>"Scanner", :version=>/^NetworkScanner WebServer Ver([\d\.]+)$/, :search=>"headers[server]" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header # KM-MFP-http
	if @headers["server"] =~ /^KM-MFP-http\/V([\d\.]+)$/

		# Model Detection
		m << { :model=>@body.scan(/^var ModelName="([^"]+)";/) } if @body =~ /^var ModelName="([^"]+)";/

	end

	# Return passive matches
	m
end

end

# An aggressive plugin could get the model from /start/start.htm

