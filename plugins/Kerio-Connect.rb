##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Kerio-Connect" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
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

