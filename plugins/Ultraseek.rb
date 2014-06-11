##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ultraseek" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "Ultraseek - web site search engine product information - Homepage [Offline] : http://www.ultraseek.com/"

# ShodanHQ results as at 2011-06-02 #
# 350 for Ultraseek



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Ultraseek\/([^\s]+)$/) } if @headers["server"] =~ /^Ultraseek\/([^\s]+)$/

	# Return passive matches
	m
end

end

