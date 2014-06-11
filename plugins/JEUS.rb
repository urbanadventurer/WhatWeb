##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "JEUS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "JEUS (Java Enterprise User Solution) is TmaxSoft's Java EE 5 certified e-Business Strategic Platform. It enables the efficient creation and implementation of a wide variety of rich user-oriented web applications, facilitates SOA concepts (Service Oriented Architecture), and provides a variety of enterprise system functions such as transaction control, session management, and distributed session clustering. - Homepage: http://us.tmaxsoft.com/jsp/product/detailcontents.jsp?psCd=00PD04&menuCd=00PDMSJE"

# ShodanHQ results as at 2011-05-12 #
# 1,543 for Jeus WebContainer
# Most results are from Korea



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Jeus WebContainer\/([\d\.]+)$/) } if @headers["server"] =~ /^Jeus WebContainer\/([\d\.]+)$/
	m << { :version=>@headers["server"].scan(/^Jeus WebContainer\/JEUS (.+)$/) } if @headers["server"] =~ /^Jeus WebContainer\/JEUS (.+)$/

	# Return passive matches
	m
end

end

