##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebSocket" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-27
version "0.1"
description "WebSocket is a technology providing for bi-directional, full-duplex communications channels, over a single Transmission Control Protocol (TCP) socket. - More info: https://secure.wikimedia.org/wikipedia/en/wiki/WebSocket - Protocol: https://tools.ietf.org/html/draft-ietf-hybi-thewebsocketprotocol-12"

# ShodanHQ results as at 2011-08-27 #
# 48 for Upgrade: websocket
#  1 for Sec-WebSocket

# Examples #
examples %w|
190.248.2.157
125.56.220.157
125.56.186.157
69.31.89.157
59.144.115.157
205.168.9.157
69.195.212.17
95.110.229.65
125.56.189.157
|

# Matches #
matches [

# Upgrade Header
{ :search=>"headers[upgrade]", :regexp=>/^WebSocket$/i },

# WebSocket-Location Header
{ :search=>"headers[websocket-location]", :string=>/^(wss?:\/\/.+)/ },

# Sec-WebSocket-Location Header
{ :search=>"headers[sec-websocket-location]", :string=>/^(wss?:\/\/.+)/ },

# Sec-WebSocket-Version-Server Header
{ :search=>"headers[sec-websocket-version-server]", :version=>/(.+)/ },

# Sec-WebSocket-Protocol Header
{ :search=>"headers[sec-websocket-protocol]", :module=>/(.+)/ },

]

end

