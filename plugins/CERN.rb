##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CERN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "The CERN httpd (also known as W3C httpd) is a generic public domain full-featured hypertext server which can be used as a regular HTTP server. Version 3.0A is the final version. It was generated July 15th 1996. - Homepage: http://www.w3.org/Daemon/"

# ShodanHQ results as at 2011-03-13 #
# 1,118 for CERN
#   969 for CERN/3.0
#    37 for CERN/3.0a

# Examples #
examples %w|
114.47.217.186
82.176.105.102
61.221.1.146
209.156.3.17
92.250.246.160
84.30.149.222
84.27.56.43
84.81.208.231
132.149.11.113
77.61.171.217
194.151.243.180
208.221.139.2
92.68.221.42
92.67.83.54
216.101.146.19
133.6.138.1
84.19.182.97
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^CERN\/([^\s^\r^\n]+)/) } if @meta["server"] =~ /^CERN\/([^\s^\r^\n]+)/

	# Return passive matches
	m

end

end

