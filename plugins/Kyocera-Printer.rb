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

# Examples #
examples %w|
74.84.110.19
134.117.113.114
138.47.42.243
218.158.1.133
12.49.170.250
149.162.115.139
141.30.144.140
141.219.38.32
208.107.40.118
130.132.196.235
168.103.46.140
147.156.177.64
131.246.185.164
63.228.188.162
130.241.22.103
12.184.106.44
142.23.66.32
|

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

