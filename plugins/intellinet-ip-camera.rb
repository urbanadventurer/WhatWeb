##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated firmware version detection
##
Plugin.define "Intellinet-IP-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.2"
description "Intellinet IP camera"
website "http://www.intellinet-network.com"
# default login: admin/admin

# Google results as at 2010-07-18 #
# 5 for intitle:"INTELLINET" intitle:"IP Camera Homepage"

# Dorks #
dorks [
'intitle:"INTELLINET" intitle:"IP Camera Homepage"'
]



# Matches #
matches [

# Default HTML
{ :text=>'    <font size="4" color="#FFFFFF" face="Arial">NETWORK IP CAMERA<br>' },

# Default Title
{ :text=>'<TITLE>::::: INTELLINET IP Camera Homepage :::::</TITLE>' },
{ :text=>'<title>::::: INTELLINET ACTIVE NETWORKING Network IP Camera Homepage :::::</title>' },
{ :text=>'<TITLE>INTELLINET NETWORK SOLUTIONS: Professional Series Network IP Camera Homepage</TITLE>' },

# Default Title # Wireless
{ :text=>'<TITLE>INTELLINET NETWORK SOLUTIONS: Professional Series Wireless Network IP Camera Homepage</TITLE>', :model=>["Wireless"] },

# Firmware Version Detection
{ :firmware=>/<font size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;FIRMWARE VERSION: ([A-Z0-9\.]+)[\s]*</ },

]

end

