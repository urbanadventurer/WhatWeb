##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kerio-Connect" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Kerio Connect (previously Kerio MailServer) is the best email, messaging, collaboration and full groupware single server solution designed for small to medium organizations, offering full support for Outlook, Entourage, Apple Mail and iCal clients and more - Homeage: http://www.kerio.com/connect"

# ShodanHQ results as at 2011-03-13 #
# 9,241 for Kerio Connect
# 4,730 for Kerio MailServer



# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Kerio (MailServer|Connect) (.+)$/)[0][1] } if @headers["server"] =~ /^Kerio (MailServer|Connect) (.+)$/

	# Return passive matches
	m

end

end

