##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SysMaster" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "SysMaster is a leading vendor of voice, video and wireless products and solutions, serving telecoms and service providers worldwide. - Homepage: http://www.sysmaster.com/"

# ShodanHQ results as at 2011-05-31 #
# 181 for SysMaster

# Examples #
examples %w|
68.126.245.50
76.119.99.173
98.248.29.190
90.149.95.164
196.218.181.67
89.27.18.74
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^SysMaster Web Server\/([^\s]+)$/) } if @meta["server"] =~ /^SysMaster Web Server\/([^\s]+)$/

	# Return passive matches
	m
end

end

