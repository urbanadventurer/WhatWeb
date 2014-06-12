##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Avaya-IP-Office" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "IP Office is Avaya's telephone system for small and medium enterprises. IP Office systems can be run in several modes. - Homepage: http://marketingtools.avaya.com/knowledgebase/"

# ShodanHQ results as at 2011-05-30 #
# 909 for IPOffice



# Matches #
matches [

# /ssa/index.html
{ :text=>'<html><head><title>IP Office System Status</title><style' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^IPOffice\/([^\s]+)$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^IPOffice\/([^\s]+)$/) }

		# Version Detection
		m << { :version=>@body.scan(/<title>About IP Office ([^\s^<]+)<\/title>/) } if @body =~ /<title>About IP Office ([^\s^<]+)<\/title>/

	end

	# Return passive matches
	m
end

end

