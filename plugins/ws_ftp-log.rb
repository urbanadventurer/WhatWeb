##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WS_FTP-log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "This plugin extratcs ftp servers from WS_FTP log files - As the leading developer of secure and managed file transfer solutions, Ipswitch offers WS_FTP Professional.the most secure and easy-to-use FTP client available."
website "http://www.ipswitchft.com/products/ws_ftp_pro/index.aspx?n=1&k_id=ipshome"

# About 16,500 results for inurl:WS_FTP ext:log @ 2010-10-15


matches [

# FTP server extraction
{ :version=>/^[0-9]+.[0-9]{2}.[0-9]{2} [0-9]{2}:[0-9]{2} [A|B]{1} [^>]*> ([^\ ]+) / },

]

end

