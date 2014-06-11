##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mathopd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-30
version "0.1"
description "Mathopd is a very small, yet very fast HTTP server for UN*X systems. It supports useful features of HTTP/1.1, such as persistent connections, partial responses and pipelining. It does not support things like content negotation. The latest version of the software (1.5) also supports CGI/1.1. - Homepage: http://www.mathopd.org/"

# ShodanHQ results as at 2011-03-30 #
# 8,170 for Mathopd



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Mathopd\/([^\s]+)/) } if @headers["server"] =~ /^Mathopd\/([^\s]+)/

	# Return passive matches
	m

end

end

