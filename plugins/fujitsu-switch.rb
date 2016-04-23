##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Fujitsu-Switch" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-12
version "0.2"
description "Fujitsu Switch"
website "http://fenics.fujitsu.com/products/sr-s/"

# ShodanHQ results as at 2011-03-12 #
# 5 for SR-S724
# 2 for SR-S224TC2
# 1 for SR-S716C2
# 3 for SR-S316C2

matches [

	# HTTP Server Header # Model Detection
	{ :model=>/^(SR-S[A-Z\d]{3,6})$/, :search=>"headers[server]" },
	
	# Firmware Version Detection # /hgi-bin/Setup/setup.cgi
	{  
	:url=>"/hgi-bin/Setup/setup.cgi", 
	:firmware=>/<TABLE cellspacing=0 cellpadding=0><TR><TD align="center"><A href="\/home.html"><IMG src="\/images\/logo.gif" alt="[^"]+" border=0><\/A><BR><FONT size='2'>SR-S[A-Z\d]{3,6}\(V([\d\.]+) config1\)<BR><\/FONT><\/TD><\/TR><TR><TH colspan=4><HR>/ 
	},

]

end


