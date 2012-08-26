##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nortel-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-15
version "0.1"
description "Nortel router - Homepage: http://www.nortel.com/"

# ShodanHQ results as at 2011-09-15 #
# 620 for Nortel Http Server

# Google results as at 2011-09-15 #
# 9 for intitle:"Nortel Secure Router" "To administer this device you must first login"

# Dorks #
dorks [
'intitle:"Nortel Secure Router" "To administer this device you must first login"'
]

# Examples #
examples %w|
4.59.116.128
173.215.168.252
173.228.226.56
98.19.223.240
207.230.201.39
65.249.137.159
omnexgroup.com
66.236.240.10.ptr.us.xo.net
ip67-91-212-19.z212-91-67.customer.algx.net
67-131-219-63.dia.static.qwest.net
72-166-54-192.dia.static.qwest.net
66-50-124-202.prtc.net
ip66-104-218-32.z218-104-66.customer.algx.net
209.31.26.1.ptr.us.xo.net
|

# Matches #
matches [

# Model Detection # Also used by other manufacturers
{ :certainty=>25, :model=>/<td class="headtext" nowrap>Router Model: (<font size=2>)?<b>([^\s^<]+)[\s]*(&nbsp;)?<\/b><\//, :offset=>1 },

# td class="greytitle"
{ :text=>'<td class="greytitle" nowrap><b>About Nortel Secure Router</b></td>' },

# Telnet link # Also used by other manufacturers
{ :certainty=>25, :text=>'<td class="headtext" nowrap><font class="yellowbullet">&#149;</font> <a href="javascript:telnetToBox();">Telnet</a></td>' },

# body HTML
{ :regexp=>/<body bgcolor=#E6E6E6 leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 style="padding: [\d]{1,2}px" onload="javascript:showspan\(\);javascript:positionmenu\(\);javascript:usrnameFocus\(\);/ },

# Server Header
{ :search=>"headers[server]", :version=>/^Nortel Http Server v([^\s]+)$/ },

]

end

