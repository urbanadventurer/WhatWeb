##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Miniature-JWS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Tiny Java Web Server and Servlet Container (aka Miniature JWS) with security update, J2EE deployment, JSP, and J2EE (without application server) - Homepage: http://tjws.sourceforge.net/"

# ShodanHQ results as at 2011-06-01 #
# 513 for Acme.Serve Rogatkin
# 505 for Acme.Serve JWS
#   8 for Acme.Serve TJWS



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^(D\. )?Rogatkin/

		# Version Detection # HTTP Server Header
		m << { :version=>@headers["server"].scan(/^Rogatkin's JWS based on Acme\.Serve\/\$Revision: ([\d\.]+) \$$/) } if @headers["server"] =~ /^Rogatkin's JWS based on Acme\.Serve\/\$Revision: ([\d\.]+) \$$/
		m << { :version=>@headers["server"].scan(/^D\. Rogatkin's TJWS based on Acme\.Serve\/Version [^,]+, \$Revision: ([\d\.]+) \$$/) } if @headers["server"] =~ /^D\. Rogatkin's TJWS based on Acme\.Serve\/Version [^,]+, \$Revision: ([\d\.]+) \$$/

	end

	# Return passive matches
	m
end

end

