##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NCSA-HTTPd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "NCSA HTTPd - Homepage: http://web.archive.org/web/20071020024535/hoohoo.ncsa.uiuc.edu/docs/Overview.html"

# ShodanHQ results as at 2011-03-13 #
# 306 for NCSA -apache -IIS -TakaC



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^NCSA\/([^\s^\r^\n]+)$/) } if @headers["server"] =~ /^NCSA\/([^\s^\r^\n]+)$/

	# Return passive matches
	m

end

end

