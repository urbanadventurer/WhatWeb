##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Web2" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-11
version "0.1"
description "A nice web server, easy to setup! lots of features including cgi, ssi, aliasing, virtual domains and more! - Homepage : Way Back Machine [2005-04-01] - http://web.archive.org/web/20050401233601/http://dink.org/"
# Homepage [Offline] : http://dink.org/web2/

# ShodanHQ results as at 2011-03-11 #
# 66 for Web/2 v1
# 48 for Web/2 v1.3x

# Examples #
examples %w|
108.21.92.14
87.245.181.194
81.222.114.138
202.173.129.46
137.207.3.37
194.44.157.2
95.167.1.242
195.96.171.3
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :os=>"Mac OS/2", :version=>@meta["server"].scan(/^Web\/2 v([^\r^\n]+)$/) } if @meta["server"] =~ /^Web\/2 v([^\r^\n]+)$/

	# Return passive matches
	m
end

end


