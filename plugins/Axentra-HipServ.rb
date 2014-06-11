##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Axentra-HipServ" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-10
version "0.1"
description "Axentra-HipServ - Digital Home/SOHO Software Platform for Internet Gateway and NAS Devices - Homepage: http://www.axentra.com/en/"

# ShodanHQ results as at 2011-05-10 #
# 21,091 for x-axentra-version
# 21,121 for HOMEBASEID



# Matches #
matches [

# Meta Author
{ :text=>'<meta name="author" content="Axentra">' },

# Title
{ :text=>'<title id="document_title">Axentra :: Digital Home/SOHO Software Platform for Internet Gateway and NAS Devices</title>' },

]

# Passive #
def passive
	m=[]

	# Version Detection # x-axentra-version Header
	m << { :version=>@headers["x-axentra-version"].to_s } unless @headers["x-axentra-version"].nil?

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


