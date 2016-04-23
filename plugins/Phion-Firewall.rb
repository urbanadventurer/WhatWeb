##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Phion-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.2"
description "Phion Firewall is now Barracuda NG Firewall"
website "http://www.phion.com/INT/products/perimeter_security/Pages/default.aspx"

# ShodanHQ results as at 2011-03-13 #
# 1,011 for Phion -apache -IIS
# Most results are from Austria

matches [
	
	# HTTP Server Header
	{ :regexp=>/^Phion/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^Phion\/(.+)$/, :search=>"headers[server]" },

]

end

