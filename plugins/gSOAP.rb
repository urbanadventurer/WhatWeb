##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "gSOAP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-05
version "0.1"
description "gSOAP Toolkit for SOAP Web Services and XML-Based Applications. The gSOAP toolkit is an open source C and C++ software development toolkit for SOAP/XML Web services and generic (non-SOAP) C/C++ XML data bindings. The toolkit analyzes WSDLs and XML schemas (separately or as a combined set) and maps the XML schema types and the SOAP messaging protocols to easy-to-use and efficient C and C++ code. - Homepage: http://gsoap2.sourceforge.net/"

# ShodanHQ results as at 2011-06-05 #
# 433 for gSOAP

# Examples #
examples %w|
91.209.42.20
112.221.36.189
112.171.70.248
183.99.85.76
59.5.86.122
50.18.59.220
115.91.72.19
14.33.79.154
14.37.44.134
222.98.50.138
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^gSOAP\/([^\s]+)$/) } if @headers["server"] =~ /^gSOAP\/([^\s]+)$/

	# Return passive matches
	m
end

end

