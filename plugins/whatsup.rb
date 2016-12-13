##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "WhatsUp" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.2"
description "WhatsUp - Network and Server Management Software"
website "http://www.whatsupgold.com/"

# ShodanHQ results as at 2011-03-13 #
# 1,127 for WhatsUp -Gold
#   647 for WhatsUp -ipswitch

matches [

	# HTTP Server Header
	{ :name=>"HTTP Server Header", :regexp=>/^WhatsUp/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :string=>"Gold", :version=>/^WhatsUp_Gold\/([\d\.]+)/, :search=>"headers[server]" },

	# WWW-Authenticate # HTTP Server Header
	{ :string=>"Gold", :certainty=>75, :name=>"WWW-Authenticate", :regexp=>/^Basic realm="WhatsUp[\s]?Gold"/, :search=>"headers[www-authenticate]" },

]

end

