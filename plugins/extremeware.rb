##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ExtremeWare" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-21
version "0.1"
description "Extreme Networks ExtremeWare device"
website "http://www.extremenetworks.com/services/software-userguide.aspx"

# ShodanHQ results as at 2011-11-21 #
# 250 for ExtremeWare

# Google results as at 2011-11-21 #
# 50 for intitle:"ExtremeWare Management Interface"

# Dorks #
dorks [
'intitle:"ExtremeWare Management Interface"'
]



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^ExtremeWare\/([^\s]+)$/ },

# /Images/extremelogan
{ :md5=>"a18d6970836e3302e4d6d085e8f9d31b", :url=>"/Images/extremelogan" },
{ :md5=>"bf368990304c878ce2924bc21b3f06d9", :url=>"/Images/extremelogan" },

# / # Title
{ :text=>'<title>ExtremeWare Management Interface</title>' },

# /extremetop # Logo HTML
{ :text=>'<center><img src="Images/extremelogan"><a href="extremebasepage" target="_top"><h2>Logon</h2></a><P><P><TABLE BORDER="0"><TR><TD NOWRAP><TT><FONT COLOR="#000000">' },

]

end

