##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Solidyne-iNET-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-11-17
version "0.1"
description "Solidyne iNET Server - web interface for Solidyne devices"
website "http://www.solidyne.com/"



# Matches #
matches [

# Title
{ :text=>'<title>Solidyne iNET Server</title>' },

# Frame
{ :text=>'<frame name="frLeft" scrolling="NO" id="frLeft" src="QFrLeft.aspx">' },

# Redirect
{ :text=>'<META HTTP-EQUIV="refresh" content="0; url=/hmi/">' },

# /hmi/sysapp/QLogin.aspx
{ :url=>"/hmi/sysapp/QLogin.aspx", :text=>'<form name="form1" method="post" action="QLogin.aspx" id="form1">' },

]

end

