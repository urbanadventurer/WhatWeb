##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Synchronet-BBS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "Synchronet Multinode BBS Software - Open source BBS that works on the DOS, Windows, or OS/2 operating system and supports multiple simultaneous users with hierarchical message and file areas, multi-user chat, and the ever-popular BBS door games. - Homepage: http://www.synchro.net/"

# ShodanHQ results as at 2011-06-04 #
# 93 for Synchronet BBS
# 69 for Synchronet BBS Win32
# 23 for Synchronet BBS Linux
#  1 for Synchronet BBS FreeBSD



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Synchronet BBS for .+ Version ([^\s]+)$/) } if @headers["server"] =~ /^Synchronet BBS for .+ Version ([^\s]+)$/

	# Return passive matches
	m
end

end

