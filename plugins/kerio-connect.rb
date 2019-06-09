##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Kerio-Connect"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-13
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Kerio Connect (previously Kerio MailServer) is the best email, messaging, collaboration and full groupware single server solution designed for small to medium organizations, offering full support for Outlook, Entourage, Apple Mail and iCal clients and more - Homeage: http://www.kerio.com/connect"

# ShodanHQ results as at 2011-03-13 #
# 9,241 for Kerio Connect
# 4,730 for Kerio MailServer

matches [
	# HTTP Server Header
	{ :regexp=>/^Kerio/, :search=>"headers[server]" },
	
	# HTTP Server Header # Version Detect
	{ :version=>/^Kerio (MailServer|Connect) (.+)$/, :offset=>1, :search=>"headers[server]" },

]

end

