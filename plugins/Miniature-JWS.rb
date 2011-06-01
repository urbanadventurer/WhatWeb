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

# Examples #
examples %w|
217.210.166.233
83.92.159.41
90.185.54.76
81.235.253.55
80.167.154.182
83.92.148.228
87.59.233.195
63.205.89.188
117.102.104.173
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^(D\. )?Rogatkin/

		# Version Detection # HTTP Server Header
		m << { :version=>@meta["server"].scan(/^Rogatkin's JWS based on Acme\.Serve\/\$Revision: ([\d\.]+) \$$/) } if @meta["server"] =~ /^Rogatkin's JWS based on Acme\.Serve\/\$Revision: ([\d\.]+) \$$/
		m << { :version=>@meta["server"].scan(/^D\. Rogatkin's TJWS based on Acme\.Serve\/Version [^,]+, \$Revision: ([\d\.]+) \$$/) } if @meta["server"] =~ /^D\. Rogatkin's TJWS based on Acme\.Serve\/Version [^,]+, \$Revision: ([\d\.]+) \$$/

	end

	# Return passive matches
	m
end

end

