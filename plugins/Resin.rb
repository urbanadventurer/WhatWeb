##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-11 #
# Updated version detection
##
Plugin.define "Resin" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.2"
description "Resin provides a reliable, fast Web server which can also be used as a load balancer. Resin can operate as a standalone server or as a fast servlet runner for IIS or Apache - homepage: http://www.caucho.com/resin/admin/http-server.xtp"

# Resin provides a fast servlet runner for IIS, allowing IIS to run servlets and JSP files :
# http://www.caucho.com/resin/admin/starting-resin-iis-7.xtp
# Resin provides a fast servlet runner for Apache 1.3 or greater, allowing Apache to run servlets and JSP files :
# http://www.caucho.com/resin/admin/starting-resin-apache.xtp

# ShodanHQ results as at 2011-02-24 #
# 25,565 for server Resin

# Examples #
examples %w|
210.73.205.244
220.181.8.109
69.195.131.29
208.64.132.155
175.45.141.211
87.119.211.53
209.200.251.9
193.178.135.9
124.238.250.67
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header # Standalone
	m << { :version=>@meta["server"].scan(/^Resin\/([^\s]+)/), :string=>"Standalone" } if @meta["server"] =~ /^Resin\/([^\s]+)/

	# Version Detection # HTTP Server Header # Plugin
	m << { :version=>@meta["server"].scan(/[\s]+Resin\/([^\s]+)/), :string=>"Plugin" } if @meta["server"] =~ /[\s]+Resin\/([^\s]+)/

	# Return passive matches
	m
end

end

