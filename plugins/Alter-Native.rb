##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Alter-Native" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "Alter-Native - IBM UniVerse database and Client/Server solutions provider. SPID Product provider, creating dynamic Web servers using database links on Unix systems. - Homepage [Offline] : http://www.alternative.fr/"

# ShodanHQ results as at 2010-12-28 #
# 20 for SPID HTTP Server -apache -IIS -nginx
# All results are from France



# Passive #
def passive
	m=[]

	# HTTP Server Header # Server: SPID HTTP Server - Alter Native
	m << { :string=>@headers["server"].scan(/^SPID HTTP Server - Alter Native \(([^\)]+)\)/) } if @headers["server"] =~ /^SPID HTTP Server - Alter Native \(([^\)]+)\)/

	# Return passive matches
	m
end

end


