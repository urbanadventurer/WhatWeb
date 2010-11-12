##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ZyXEL-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "ZyXEL VSG-1200 V2 is access server that recognizes new users on network and re-routes all the different IP settings pre-configured on users' computers. - homepage: http://www.zyxel.com/"
# P-330W EE # Default Login:
# admin/password

# About 195 ShodanHQ results for WWW-Authenticate: Basic realm="P-330W EE (username: admin)" @ 2010-11-01
# 33 results for intitle:Top "Vantage Service Gateway" -inurl:zyxel @ 2010-07-24
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1853
examples %w|
70.169.169.199/top.htm
210.176.164.58/top.htm
24.153.183.242/top.htm
67.53.102.106/top.htm
94.216.163.1/top.htm
213.236.165.126/top.htm
fleta.org/top.htm
68.185.53.190/top.htm
67.79.70.218/top.htm
southernblairems.com/top.htm
65.23.108.18/top.htm
www.panimas.es/top.htm
sheraton.com.ec/top.htm
74.218.130.219/top.htm
24.199.41.82/top.htm
https://207.190.252.194/top.htm
77.43.220.206
109.194.65.167
89.184.22.156
83.167.114.66
109.122.0.190
188.186.132.91
|

matches [

# Vantage Service Gateway # Default HTML
{ :text=>'<font size="3" color="3366CC" face="Arial"><b><i>Vantage Service Gateway</i>&nbsp;</b></font>', :model=>"Vantage Service Gateway" },

# Vantage Service Gateway # Default Frameset
{ :text=>'<frameset rows="75,97%,25" framespacing="0" border="0" frameborder="0">', :model=>"Vantage Service Gateway" },

# Prestige 660H61 # Default Logo
{ :model=>'Prestige 660H61', :status=>200, :url=>'/dslroutery/imgshop/full/NETZ1431.jpg' },

]

# Passive #
def passive
        m=[]

	# P-330W EE # HTTP Server Header and WWW-Authenticate realm
	m << { :model=>"P-330W EE" } if @meta["www-authenticate"]=~ /Basic realm="P-330W EE \(username: admin\)"/ and @meta["server"] =~ /GoAhead-Webs/ and @status == 401

	# Vantage Service Gateway # Version Detection
	m << { :url=>"/top.htm", :model=>"Vantage Service Gateway "+@body.scan(/<td align="right"><font size="3" color="3366CC" face="Arial"><b><i>VSG-([\d\ V]+)<\/i>&nbsp;<\/b><\/font><\/td><\/tr>/).to_s } if @body =~ /<td align="right"><font size="3" color="3366CC" face="Arial"><b><i>VSG-[\d\ V]+<\/i>&nbsp;<\/b><\/font><\/td><\/tr>/

        m

end

end

