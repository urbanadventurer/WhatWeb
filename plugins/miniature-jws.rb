##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Miniature-JWS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.2"
description "Tiny Java Web Server and Servlet Container (aka Miniature JWS) with security update, J2EE deployment, JSP, and J2EE (without application server)"
website "http://tjws.sourceforge.net/"

# ShodanHQ results as at 2011-06-01 #
# 513 for Acme.Serve Rogatkin
# 505 for Acme.Serve JWS
#   8 for Acme.Serve TJWS

matches [
	# HTTP Server Header
	{ :regexp=>/^(D\. )?Rogatkin/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^Rogatkin's JWS based on Acme\.Serve\/\$Revision: ([\d\.]+) \$$/, :search=>"headers[server]" },
	{ :version=>/^D\. Rogatkin's TJWS based on Acme\.Serve\/Version [^,]+, \$Revision: ([\d\.]+) \$$/, :search=>"headers[server]" },

]

end

