##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CrushFTP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-02
version "0.1"
description "A full-scale FTP server by Ben Spink written in Java using the SWING user interface libraries. [Mac OS/Windows/Linux] - Homepage: http://www.crushftp.com/"

# ShodanHQ results as at 2011-04-02 #
# 33 for CrushFTP



# Matches #
matches [

# JavaScript
{ :certainty=>25, :text=>'<script type="text/javascript" src="crushftp_functions.js"></script>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	if @headers["server"] =~ /^CrushFTP (HTTP[\d]? Server )?Version ([\d\.]+)$/

		# Version Detection # HTTP Server
		m << { :version=>@headers["server"].scan(/^CrushFTP (HTTP[\d]? Server )?Version ([\d\.]+)$/)[0][1] } if @headers["server"] =~ /^CrushFTP (HTTP[\d]? Server )?Version ([\d\.]+)$/

		# Account Detection # X-dmUser
		m << { :account=>@headers["x-dmuser"] } unless @headers["x-dmuser"].nil?
	end

	# CrushAuth Cookie
	m << { :name=>"CrushAuth Cookie" } if @headers["set-cookie"] =~ /^CrushAuth=/

	# WWW-Authenticate
	m << { :version=>@headers["www-authenticate"].scan(/^Basic realm="CrushFTP Server Version ([\d\.]+)"$/) } if @headers["www-authenticate"] =~ /^Basic realm="CrushFTP Server Version ([\d\.]+)"$/

	# Return passive matches
	m

end

end

