##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Icecast" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "Icecast is a GPL streaming media server project that currently streams in MP3 format. - Homepage: http://www.icecast.org/"

# ShodanHQ results as at 2011-08-07 #
# 75 for icecast

# Examples #
examples %w|
91.184.192.11
209.9.238.67
204.93.222.91
195.190.137.196
194.97.151.150
202.0.155.77
194.30.0.193
195.227.130.212
204.93.226.36
80.69.78.251
193.213.115.197
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @meta["server"] =~ /^Icecast ([^\s]+)/
		m << { :version=>"#{$1}" }
	end
	if @meta["server"] =~ /^icecast\/([^\s]+)/
		m << { :version=>"#{$1}" }
	end

	# icy-name Header
	m << { :string=>@meta["icy-name"].to_s } unless @meta["icy-name"].nil?

	# WWW-Authenticate Header
	m << { :certainty=>75, :name=>"WWW-Authenticate Header" } if @meta["www-authenticate"] =~ /Basic realm="Icecast/

	# Return passive matches
	m
end
end

