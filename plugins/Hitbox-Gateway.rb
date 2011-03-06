##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Hitbox-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "Adobe Omniture Hitbox Gateway collects HTTP headers for web site usage statistics - Homepage: http://login.hitbox.com/"

# ShodanHQ results as at 2011-06-03 #
# 463 for Server Hitbox Gateway
# All results are from the United States

# Examples #
examples %w|
64.154.84.42
64.154.84.53
64.154.84.78
64.154.84.85
64.154.84.122
64.154.84.189
64.154.84.204
64.154.85.1
64.154.85.2
64.154.85.3
64.154.85.4
64.154.85.5
64.154.85.6
64.154.85.7
64.154.85.8
64.154.85.9
64.154.85.10
64.154.85.11
64.154.85.12
64.154.85.13
64.154.85.14
64.154.85.15
64.154.85.16
64.154.85.17
64.154.85.19
64.154.85.20
64.154.85.21
64.154.85.28
64.154.85.51
64.154.87.29
64.154.87.47
64.154.87.63
64.154.87.88
64.154.87.91
64.154.87.111
64.154.87.116
64.154.87.132
64.154.87.157
64.154.87.174
64.154.87.189
|

# Matches #
matches [

# /favicon.ico
{ :url=>"/favicon.ico", :md5=>"0c7fdff990b60f5c7ec6ecf995c6f59f" },

]

# Passive #
def passive
	m=[]

	# Version Detection # Server: Hitbox Gateway
	m << { :version=>@meta["server"].scan(/^Hitbox Gateway ([^\s^\r^\n]{1,10})$/) } if @meta["server"] =~ /^Hitbox Gateway ([^\s^\r^\n]{1,10})$/

	# Return passive matches
	m
end

end

