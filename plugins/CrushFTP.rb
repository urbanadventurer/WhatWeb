##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Replaced passive function with matches
##
Plugin.define "CrushFTP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-02
version "0.2"
description "A full-scale FTP server by Ben Spink written in Java using the SWING user interface libraries. [Mac OS/Windows/Linux]"
website "http://www.crushftp.com/"

# ShodanHQ results as at 2011-04-02 #
# 33 for CrushFTP

# Matches #
matches [

# JavaScript
{ :certainty=>25, :text=>'<script type="text/javascript" src="crushftp_functions.js"></script>' },

# HTTP Server header
{ :regexp=>/^CrushFTP /, :search=>"headers[server]" },

# Version Detection # HTTP Server
{ :version=>/^CrushFTP (HTTP[\d]? Server )?Version ([\d\.]+)$/, :offset=>1, :search=>"headers[server]" },

# CrushAuth Cookie
{ :name=>"CrushAuth Cookie", :regexp=>/^CrushAuth=/,  :search=>"headers[set-cookie]" },

# WWW-Authenticate
{ :name=>"WWW-Authenticate", :version=>/^Basic realm="CrushFTP Server Version ([\d\.]+)"$/,  :search=>"headers[www-authenticate]" },

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	if @headers["server"] =~ /^CrushFTP /

		# Account Detection # X-dmUser
		m << { :account=>@headers["x-dmuser"] } unless @headers["x-dmuser"].nil?
	end

	# Return passive matches
	m

end

end

