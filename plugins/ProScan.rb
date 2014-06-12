##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ProScan" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-13
version "0.1"
description "Streams audio - homepage: http://www.proscan.org/"

# ShodanHQ results as at 2011-05-13 #
# 12 for ProScan



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^ProScan ([^\s]+)$/) } if @headers["server"] =~ /^ProScan ([^\s]+)$/

	# icy-notice2 Header
	m << { :name=>"icy-notice2 header" } if @headers["icy-notice2"] =~ /^ProScan\.\.\. see http:\/\/www\.proscan\.org$/

	# Return passive matches
	m
end

end

