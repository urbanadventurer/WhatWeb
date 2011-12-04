##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Intoto-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-18
version "0.1"
description "Intoto router - Homepage: http://www.intoto.com/"

# ShodanHQ results as at 2011-08-18 #
# 11,956 for Intoto Http Server

# Google results as at 2011-08-18 #
# 6 for intitle:"Device Manager" "To administer this device you must first login"

# Dorks #
dorks [
'intitle:"Device Manager" "To administer this device you must first login"'
]

# Examples #
examples %w|
ip67-94-228-1.z228-94-67.customer.algx.net
216-206-27-64.dia.static.qwest.net
w224.z064220019.hrt-ct.dsl.cnc.net
71.4.210.255
ip67-153-108-0.z108-153-67.customer.algx.net
140.239.209.111
66.17.53.104
66.104.15.143
65.91.62.223
67.106.137.129
204.191.53.23
66.106.13.151
65.118.251.239
113.160.225.195
|

# Matches #
matches [

# Model Detection # Also used by Nortel router
{ :certainty=>75, :model=>/<td class="headtext" nowrap>Router Model: (<font size=2>)?<b>([^\s^<]+)[\s]*(&nbsp;)?<\/b><\//, :offset=>1 },

# td class="greytitle"
{ :text=>'<td class="greytitle" nowrap><b>About Device Manager </b></td> ' },

# Telnet link # Also used by Nortel router
{ :certainty=>25, :text=>'<td class="headtext" nowrap><font class="yellowbullet">&#149;</font> <a href="javascript:telnetToBox();">Telnet</a></td>' },

# body HTML
{ :regexp=>/<body bgcolor=#E6E6E6 leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 style="padding: [\d]{1,2}px" onload="javascript:usrnameFocus\(\);javascript:isValidBrowser\(\);/ },

# Server Header
{ :search=>"headers[server]", :version=>/^Intoto Http Server v([^\s]+)$/ },

]

end

