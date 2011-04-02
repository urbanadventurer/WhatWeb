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

# Examples #
examples %w|
82.99.15.25
71.133.56.102
64.2.2.94
75.147.226.217
70.164.23.115
128.173.188.208
64.198.86.195
198.184.211.28
38.117.244.35
209.207.125.1
213.249.154.9
81.171.226.153
93.166.236.142
194.78.228.99
174.34.65.210
94.101.216.242
202.20.7.10
63.116.168.54
95.97.13.234
|

# Matches #
matches [

# JavaScript
{ :certainty=>25, :text=>'<script type="text/javascript" src="crushftp_functions.js"></script>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	if @meta["server"] =~ /^CrushFTP (HTTP[\d]? Server )?Version ([\d\.]+)$/

		# Version Detection # HTTP Server
		m << { :version=>@meta["server"].scan(/^CrushFTP (HTTP[\d]? Server )?Version ([\d\.]+)$/)[0][1] } if @meta["server"] =~ /^CrushFTP (HTTP[\d]? Server )?Version ([\d\.]+)$/

		# Account Detection # X-dmUser
		m << { :account=>@meta["x-dmuser"] } unless @meta["x-dmuser"].nil?
	end

	# CrushAuth Cookie
	m << { :name=>"CrushAuth Cookie" } if @meta["set-cookie"] =~ /^CrushAuth=/

	# WWW-Authenticate
	m << { :version=>@meta["www-authenticate"].scan(/^Basic realm="CrushFTP Server Version ([\d\.]+)"$/) } if @meta["www-authenticate"] =~ /^Basic realm="CrushFTP Server Version ([\d\.]+)"$/

	# Return passive matches
	m

end

end

