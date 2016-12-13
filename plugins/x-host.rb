##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Host" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-08
version "0.1"
description "This plugin retrieves the X-Host, X-HostName, X-Host-Name and X-Host-IP value from the HTTP header."

# About 957 ShodanHQ results for X-Host @ 2011-01-08
# About 20 ShodanHQ results for X-Host-Name @ 2011-01-08



# Passive #
def passive
	m=[]

	# X-Host HTTP Header
	# Apache picks the X-Host header over the Host header, so if there are
	# two different virtual hosts, origin.example.com and www.example.com,
	# the request ends up at www.example.com instead of the intended
	# origin.example.com.
	# http://www.alphastate.com/x-host-vs-host-headers-in-apache
	m << { :string=>@headers["x-host"].to_s } unless @headers["x-host"].nil?

	# X-Host-Name HTTP Header
	m << { :string=>@headers["x-host-name"].to_s } unless @headers["x-host-name"].nil?

	# X-HostName HTTP Header
	m << { :string=>@headers["x-hostname"].to_s } unless @headers["x-hostname"].nil?

	# X-Host-IP HTTP Header
	# WonderProxy is the only software known to use this header however
	# there are no ShodanHQ results for "X-Host-IP" so this is unconfirmed.
	# Please let me know if you can confirm otherwise. bcoles@gmail.com
	# "We're planning to roll out a new feature allowing customers to
	# inject a hosts file onto the proxy server of their choice to allow
	# server selection through a web interface."
	# http://blog.preinheimer.com/index.php?/archives/349-X-Host-IP.html
	m << { :string=>@headers["x-host-ip"].to_s, :module=>"WonderProxy" } unless @headers["x-host-ip"].nil?

	m

end

end

