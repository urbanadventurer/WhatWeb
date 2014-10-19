##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Silex-Print-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-08
version "0.1"
description "Silex Print Server - Print servers connect printers directly to the network so that multiple PCs can share them."
website "http://www.silexamerica.com/"

# ShodanHQ results as at 2011-03-08 #
# 154 for silex Web Admin

# Google results as at 2011-03-08 #
# 4 for "System Description:" "silex SX-500"

# Dorks #
dorks [
'"System Description:" "silex SX-500"'
]



# Matches #
matches [

# Default Printer Logo
{ :url=>"/troy_large_bw.gif", :md5=>"ba4feb9ffb5d77f9c72269549d07b78e" },

# Default Logo
{ :url=>"/silex_logo.gif", :md5=>"ba4feb9ffb5d77f9c72269549d07b78e" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^silex Web Admin$/

		# HTTP Server Header
		m << { :name=>"HTTP Server Header" }

		# Printer Model Detection # Default Title
		m << { :string=>@body.scan(/<TITLE>([^<]{5,20})<\/TITLE>/) } if @body =~ /<TITLE>([^<]{5,20})<\/TITLE>/

		# Print Server Model Detection # Default Title
		m << { :model=>@body.scan(/<TITLE>[S|s]ilex ([^\s^<]{5,10})<\/TITLE>/), } if @body =~ /<TITLE>[S|s]ilex ([^\s^<]{5,10})<\/TITLE>/

	end

	# Return passive matches
	m
end

end


