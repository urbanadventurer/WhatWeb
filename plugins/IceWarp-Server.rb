##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IceWarp-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "IceWarp Unified Communications Server is a fully integrated email server, webmail server, groupware, instant messaging, VoIP / SIP, text messaging. - Homepage: http://www.icewarp.com/"

# ShodanHQ results as at 2011-03-17 #
# 6,632 for IceWarp -WebSrv
#   259 for IceWarp WebSrv



# Passive #
def passive
	m=[]

	# Version Detection # IceWarp
	m << { :version=>@headers["server"].scan(/^IceWarp\/(.+)$/) } if @headers["server"] =~ /^IceWarp( WebSrv)?\/(.+)$/

	# Version Detection # IceWarp WebSrv
	m << { :version=>@headers["server"].scan(/^IceWarp WebSrv\/(.+)$/) } if @headers["server"] =~ /^IceWarp( WebSrv)?\/(.+)$/

	# Return passive matches
	m

end

end

