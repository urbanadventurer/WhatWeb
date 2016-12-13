##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Sun-GlassFish" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-19
version "0.2"
description "GlassFish is an open source application server project led by Sun Microsystems for the Java EE platform. The proprietary version is called Sun GlassFish Enterprise Server. GlassFish supports All Java EE API specifications, such as JDBC, RMI, e-mail, JMS, web services, XML, etc., and defines how to coordinate them."
website "http://glassfish.java.net/"

# More Info #
# http://en.wikipedia.org/wiki/GlassFish

# ShodanHQ results as at 2011-06-19 #
# 4,489 for GlassFish
# 3,292 for GlassFish Sun
# 2,968 for GlassFish Enterprise
# 1,197 for GlassFish -Sun
#   733 for GlassFish Open Source

matches [

	# HTTP Server Header
	{ :regexp=>/^GlassFish/, :search=>"headers[server]" },

	# HTTP Server Header
	{ :version=>/^GlassFish v(.+)$/, :search=>"headers[server]" },

	# HTTP Server Header
	{ :string=>"Open Source Edition", :version=>/^GlassFish Server Open Source Edition (.+)$/, :search=>"headers[server]" },

	# HTTP Server Header
	{ :string=>"Enterprise Server", :version=>/Sun GlassFish Enterprise Server v(.+)$/, :search=>"headers[server]" },

]

end

