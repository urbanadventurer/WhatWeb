##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DXSock" do
author "Brendan Coles <bcoles@gmail.com>" # 2015-05-05
version "0.1"
description "DXSock is a developer library sold with full source code. The product is geared towards low-level client and server development. Supporting TCP/IP and UDP/IP solution, along with low-level Linux and Mac file devices. - Homepage: http://www.dxsock.com/view/"

# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^RemObjects DXSock Web Server/ },

# User-Agent Header
{ :search=>"headers[user-agent]", :regexp=>/^RemObjects SDK$/ },

]

end

