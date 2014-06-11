##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MochiWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-21
version "0.1"
description "MochiWeb is an Erlang library for building lightweight HTTP servers. WebMachine is a REST-based system for building web applications on top of the bit-pushing and HTTP syntax-management provided by MochiWeb, and provides a simple and clean way to connect that to your application's behavior. - Homepages: https://github.com/mochi/mochiweb - https://bitbucket.org/justin/webmachine/wiki/Home"

# ShodanHQ results as at 2011-06-21 #
# 190 for MochiWeb
# 155 for MochiWeb -WebMachine



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^MochiWeb/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^MochiWeb\/([^\s]+)/) } if @headers["server"] =~ /^MochiWeb\/([^\s]+)/

		# Version Detection # WebMachine Module
		m << { :module=>@headers["server"].scan(/ (WebMachine\/[^\s]+)/) } if @headers["server"] =~ / (WebMachine\/[^\s]+)/

	end

	# Return passive matches
	m
end

end

