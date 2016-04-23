##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Parallel-Crystal-Load-Balancer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.2"
description "Parallel Crystal load balancing server"
website "http://www.dynalivery.com/products/parallelcrystal/parallelcrystal2_x.html"

# Manual: http://www.dynalivery.com/products/parallelcrystal/v2_3/V2_3Install-UsersGuide.pdf

# ShodanHQ results as at 2011-07-27 #
# 6 for Crystal2 BalancerServer

matches [
	# HTTP Server Header
	{ :regexp=>/^Crystal2 BalancerServer/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^Crystal2 BalancerServer ([\d\.]+)$/, :search=>"headers[server]" },

]

end

