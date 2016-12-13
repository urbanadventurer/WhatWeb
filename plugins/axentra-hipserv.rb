##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##

Plugin.define "Axentra-HipServ" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-10
version "0.2"
description "Axentra-HipServ - Digital Home/SOHO Software Platform for Internet Gateway and NAS Devices"
website "http://www.axentra.com/en/"

# ShodanHQ results as at 2011-05-10 #
# 21,091 for x-axentra-version
# 21,121 for HOMEBASEID

# Matches #
matches [

# Meta Author
{ :text=>'<meta name="author" content="Axentra">' },

# Title
{ :text=>'<title id="document_title">Axentra :: Digital Home/SOHO Software Platform for Internet Gateway and NAS Devices</title>' },

# Version Detection # x-axentra-version Header
{ :regexp=>//, :search=>"headers[x-axentra-version]" },

# Version Detection # x-axentra-version Header
{ :name=>"HOMEBASEID Cookie", :regexp=>/HOMEBASEID=/, :search=>"headers[set-cookie]" },

]

# Passive #
def passive
	m=[]

	# HOMEBASEID Cookie
	if @headers["set-cookie"] =~ /HOMEBASEID=/

		m << { :name=>"HOMEBASEID Cookie" }

		# Account Detection # HTTP Location header # hipname param
		if @headers["location"] =~ /\?hipname=([^&]+)/
			m << { :account=>@headers["location"].scan(/\?hipname=([^&]+)/) }
		end

	end

	# Return passive matches
	m
end

end


