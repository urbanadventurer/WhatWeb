##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Replaced passive function with match for server header
##
Plugin.define "Alter-Native" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.2"
description "Alter-Native - IBM UniVerse database and Client/Server solutions provider. SPID Product provider, creating dynamic Web servers using database links on Unix systems. - Homepage [Offline] : http://www.alternative.fr/"

# ShodanHQ results as at 2010-12-28 #
# 20 for SPID HTTP Server -apache -IIS -nginx
# All results are from France

matches [
	{ :string=>/^SPID HTTP Server - Alter Native \(([^\)]+)\)/, :search=>"headers[server]" },
]

end


