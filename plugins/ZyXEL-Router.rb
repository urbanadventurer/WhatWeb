##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-09 #
# Updated model detection
#
# Version 0.3
# Added signatures by Andrew Horton

##
Plugin.define "ZyXEL-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.3"
description "This plugin indentifies ZyXEL router models"
# Tested on models: P-660H-D1, P-660HW-D1, P-660R-D1, P-662H-D1, P-662HW-D3, P-2602H-D1A, P-2602HW-D1A, P-2802HWL-I1, P660RU2, P660HT2, Prestige 660H61
# ZyXEL VSG-1200 V2 is access server that recognizes new users on network and re-routes all the different IP settings pre-configured on users' computers. - homepage: http://www.zyxel.com/"
# P-330W EE # Default Login # admin/password

# ShodanHQ results as at 2010-11-01 #
# 195 for WWW-Authenticate: Basic realm="P-330W EE (username: admin)"

# Google results as at 2011-01-09 #
# 33 for intitle:Top "Vantage Service Gateway" -inurl:zyxel
# 90 for "Welcome to the Web-Based Configurator" "Welcome to your router Configuration Interface"

# Examples #
examples %w|
spamdns.com
www.scholiast.org
195.210.177.1
www.d-xtra.net
195.210.180.229
124.104.101.211
bilgiset.net
worldtours-rentacar.com
www.brts.webhop.net
66.178.129.151
www.sagaheilsa.is
213.180.170.149
www.stripstyle24h.ee
78.186.250.202
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

# Matches #
matches [

# Meta generator
{ :text=>'<meta name="generator" content="GoLive CyberStudio 3">' },

# Default title
{ :text=>"<title>.:: Welcome to the Web-Based Configurator::.</title><meta http-equiv='content-type' content='text/html;charset=iso-8859-1'>" },

# Default form HTML
{ :text=>'<form method="post" action="/Forms/rpAuth_1" onSubmit="LoginClick(document.forms[0].hiddenPassword, document.forms[0].LoginPassword);"><p>&nbsp;</p>' },

# Default welcome message HTML
{ :text=>'Welcome to your router Configuration Interface<p></p>Enter your password and press enter or click "Login"<p></p><img src="Images/i_key.gif" width="11" height="17"  align="absmiddle"> <strong>' },

# Model Detection # Login page HTML
{ :model=>/<td align=center><p class="style1">[\r\n\s]*([^<^\s]+)[\s]*<br \/><br \/><\/p><\/td><\/tr><tr>/ },

# Vantage Service Gateway # Default HTML
{ :text=>'<font size="3" color="3366CC" face="Arial"><b><i>Vantage Service Gateway</i>&nbsp;</b></font>', :model=>"Vantage Service Gateway" },

# Vantage Service Gateway # Default Frameset
{ :text=>'<frameset rows="75,97%,25" framespacing="0" border="0" frameborder="0">', :model=>"Vantage Service Gateway" },

{ :text=>'loginPassword.value = "ZyXEL ZyWALL Series";'},

{ :version=>/<td height="40" colspan="4" class="Auth">Prestige ([^<]+)<\/td>/}

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

=begin

md5 hashes are required for these images:

{ :model=>'Prestige 660H61', :url=>'/dslroutery/imgshop/full/NETZ1431.jpg' },

=end

