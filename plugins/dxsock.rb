##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "DXSock"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2015-05-05
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
]
version "0.2"
description "DXSock is a developer library sold with full source code. The product is geared towards low-level client and server development. Supporting TCP/IP and UDP/IP solution, along with low-level Linux and Mac file devices."
website "http://www.dxsock.com/view/"

# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^RemObjects DXSock Web Server/ },

# User-Agent Header
{ :search=>"headers[user-agent]", :regexp=>/^RemObjects SDK$/ },

]

end

