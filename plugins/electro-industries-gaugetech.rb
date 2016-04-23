##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Electro-Industries-GaugeTech" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-09
version "0.1"
description "Electro Industries GaugeTech Device - Electro Industries meters are known world-wide for their ease of use, advanced power functionality and reliable service."
website "http://www.electroind.com/"

# ShodanHQ results as at 2011-03-09 #
# 102 for EIG Embedded Web Server



# Matches #
matches [

# Model Detection # Nexus # /meter_information.htm
{ :url=>"/meter_information.htm", :model=>/<td width=135 bgcolor="#000000"><b><font face="Verdana" size="2" color="#FF0000">&nbsp;Device[\s\r\n]*Type<\/font><\/b><\/td>[\s\r\n]*<td width=150 bgcolor="#CCCCCC">[\s\r\n]*<div align="center"><font color="#000000" size="2" face="Verdana">[\s\r\n]*([^\r^\n]+)[\s\r\n]*<\/font><\/div>/ },

# Model Detection # Shark # /meter_information.htm
{ :url=>"/meter_information.htm", :model=>/<td width=108 bgcolor="#B9BEC2"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#990000">&nbsp;[\s\r\n]*Device Type<\/font><\/b><\/td>[\s\r\n]*<td width=150 bgcolor="#FFFFFF"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">[\s\r\n]*([^\r^\n^\s^<]{3,5})[^<]*<\/font><\/div>/, :string=>"Shark" },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^EIG Embedded Web Server$/ },

]

end


