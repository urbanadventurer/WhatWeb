##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kyocera-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Web interface for Kyocera printers. Some models have built in fax and scanner capabilities. - Homepage: http://global.kyocera.com/"

# ShodanHQ results as at 2011-05-31 #
# 4,783 for JC-HTTPD
# 2,181 for NetworkScanner
# 1,943 for KM-httpd
# 1,324 for KM-MFP-http



# Passive #
def passive
	m=[]

	# HTTP Server Header # KM-MFP-http
	if @headers["server"] =~ /^KM-MFP-http\/V([\d\.]+)$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^KM-MFP-http\/V([\d\.]+)$/) }

		# Model Detection
		m << { :model=>@body.scan(/^var ModelName="([^"]+)";/) } if @body =~ /^var ModelName="([^"]+)";/

	end

	# Version Detection # HTTP Server Header # KM-httpd
	m << { :version=>@headers["server"].scan(/^KM-httpd\/([\d\.]+)$/) } if @headers["server"] =~ /^KM-httpd\/([\d\.]+)$/

	# Version Detection # HTTP Server Header # JC-HTTPD
	m << { :version=>@headers["server"].scan(/^JC-HTTPD\/([\d\.]+)$/) } if @headers["server"] =~ /^JC-HTTPD\/([\d\.]+)$/

	# Version Detection # HTTP Server Header # NetworkScanner WebServer Ver
	m << { :string=>"Scanner", :version=>@headers["server"].scan(/^NetworkScanner WebServer Ver([\d\.]+)$/) } if @headers["server"] =~ /^NetworkScanner WebServer Ver([\d\.]+)$/

	# Return passive matches
	m
end

end

# An aggressive plugin could get the model from /start/start.htm

