##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RemotelyAnywhere" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08 #
version "0.1"
description "A small HTTP daemon, which enables you to access and manage services, processes, users, and files on the remote computer over the network. - Homepage: http://www.remotelyanywhere.com/"

# ShodanHQ results as at 2011-04-08 #
# 213 for RemotelyAnywhere

# Examples #
examples %w|
14.198.9.92
58.177.22.212
76.123.119.84
85.48.108.39
122.41.36.28
76.16.74.68
88.103.135.153
155.246.96.152
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^RemotelyAnywhere\/([\d\.]+)$/) } if @headers["server"] =~ /^RemotelyAnywhere\/([\d\.]+)$/

	# Return passive matches
	m
end

end

