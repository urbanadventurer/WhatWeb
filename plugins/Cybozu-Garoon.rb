##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cybozu-Garoon" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Cybozu Garoon is a web-based groupware suite integrating key collaboration applications that provide a ready-to-run intranet solution. - Homepage: http://cybozu.com/en/grn/product/"

# ShodanHQ results as at 2011-05-31 #
# 251 for Cybozu-WS
# Most results are from Japan



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Cybozu-WS\/([^\s]+)$/) } if @headers["server"] =~ /^Cybozu-WS\/([^\s]+)$/

	# Return passive matches
	m
end

end

