##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmartCDS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-06
version "0.1"
description "SmartCDS (Content Delivery Server) hardware [Japanese] - Homepage: http://www.globaldawin.com/product/smartcds.php3"

# ShodanHQ results as at 2011-07-06 #
# 420 for SmartCDS
#  17 for X-SmartCDS-Error



# Matches #
matches [

# Error Page
{ :text=>'<img border=0 src="http://www.globaldawin.com/capcds/refresh.gif" width="13" height="16"' },

]

# Passive #
def passive
	m=[]

	# Version Detection # SmartCDS Header
	m << { :version=>@headers["smartcds"].scan(/^Version:([^\s]+)$/) } if @headers["smartcds"] =~ /^Version:([^\s]+)$/

	# Version Detection # Server Header
	m << { :version=>@headers["server"].scan(/^smartcds\/([^\s]+)/) } if @headers["server"] =~ /^smartcds\/([^\s]+)/

	# Error Detection # X-SmartCDS-Error Header
	m << { :string=>@headers["x-smartcds-error"].to_s } unless @headers["x-smartcds-error"].nil?

	# Return passive matches
	m
end

end

