##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TivoWebPlus" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-21
version "0.1"
description "TivoWebPlus is a web server that runs on your TiVo PVR. It is written in TCL, and has the ability to browse the channel guide, perform searches, and schedule and delete recordings. - Homepage: http://sourceforge.net/projects/tivowebplus/"

# ShodanHQ results as at 2011-05-21 #
# 31 for TivoWebPlus



# Passive #
def passive
	m=[]

	# Version Detection # WWW-Authenticate Realm
	m << { :version=>@headers["www-authenticate"].scan(/^Basic realm=['"]TivoWebPlus - v([^'^"]+)['"]$/) } if @headers["www-authenticate"] =~ /^Basic realm=['"]TivoWebPlus - v([^'^"]+)['"]$/

	# Return passive matches
	m
end

end

