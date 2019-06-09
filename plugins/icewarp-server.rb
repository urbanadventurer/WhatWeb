##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "IceWarp-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-17
  "Andrew Horton", # v0.2 # 2016-04-20 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "IceWarp Unified Communications Server is a fully integrated email server, webmail server, groupware, instant messaging, VoIP / SIP, text messaging."
website "http://www.icewarp.com/"

# ShodanHQ results as at 2011-03-17 #
# 6,632 for IceWarp -WebSrv
#   259 for IceWarp WebSrv

matches [
	
	{ :regexp=>/^IceWarp/, :search=>"headers[server]" },

	# Version Detection # IceWarp
	{ :version=>/^IceWarp\/(.+)$/, :search=>"headers[server]" },

	# Version Detection # IceWarp WebSrv
	{ :version=>/^IceWarp WebSrv\/(.+)$/, :search=>"headers[server]" },
	
]

end

