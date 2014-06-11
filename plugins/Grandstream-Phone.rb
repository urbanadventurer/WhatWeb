##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

#version 0.2 Andrew Horton - added matches[] for devices without a Server: header, removed out of date examples

Plugin.define "Grandstream-Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "Grandstream Networks is the leading manufacturer of IP voice/video telephony and video surveillance solutions. - Homepage: http://www.grandstream.com/"

# ShodanHQ results as at 2011-03-14 #
# 25,344 for Grandstream



matches [
{:text=>'<title>Grandstream Device Configuration</title>'},
{:text=>'All Rights Reserved Grandstream Networks, Inc.', :url=>"/"}
]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Grandstream/

		# Model Detection
		m << { :model=>@headers["server"].scan(/^Grandstream ([^\s]+) [\d\.]+$/) } if @headers["server"] =~ /^Grandstream ([^\s]+) [\d\.]+$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^Grandstream [^\s]+ ([\d\.]+)$/) } if @headers["server"] =~ /^Grandstream [^\s]+ ([\d\.]+)$/

		m << { :version=>@headers["server"].scan(/^Grandstream\/([\d\.]+)$/) } if @headers["server"] =~ /^Grandstream\/([\d\.]+)$/

	end

	# Return passive matches
	m
end

end

