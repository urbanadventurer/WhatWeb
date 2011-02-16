##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Backend" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-16
version "0.1"
description "This plugin identifies and extracts the value for X-Backend, X-Backend-Server, X-BackendHost and X-Backend-Host from the HTTP headers."

# ShodanHQ results as at 2011-02-16 #
# 66 for X-Backend-Server
# 4 for X-BackendHost
# 3 for X-Backend-Host

# Examples #
examples %w|
63.245.208.197
63.245.209.112
63.245.209.32
63.245.209.139
63.245.209.10
63.245.213.96
59.151.50.59
63.245.209.133
203.34.47.175
63.245.209.104
134.58.239.51
134.58.239.30
134.58.239.63
134.58.239.64
|

# Passive #
def passive
	m=[]

	# HTTP Header # X-Backend
	m << { :string=>@meta["x-backend"].to_s } unless @meta["x-backend"].nil?

	# HTTP Header # X-Backend-Server
	m << { :string=>@meta["x-backend-server"].to_s } unless @meta["x-backend-server"].nil?

	# HTTP Header # X-BackendHost
	m << { :string=>@meta["x-backendhost"].to_s } unless @meta["x-backendhost"].nil?

	# HTTP Header # X-Backend-Host
	m << { :string=>@meta["x-backend-host"].to_s } unless @meta["x-backend-host"].nil?

	# Return passive matches
	m
end

end


