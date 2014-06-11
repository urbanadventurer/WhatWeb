##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "fnord" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "fnord - yet another small httpd - Homepage: http://www.fefe.de/fnord/"

# ShodanHQ results as at 2011-05-31 #
# 6,444 for fnord



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^fnord\/([^\s]+)$/) } if @headers["server"] =~ /^fnord\/([^\s]+)$/

	# Return passive matches
	m
end

end

