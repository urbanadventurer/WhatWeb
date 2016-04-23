##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.6 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 0.5 Andrew Horton - added version detection for Prestige models
##
# Version 0.4 # 2011-06-04
# Updated regex
# Added www-authenticate HTTP header matches
# Added ZyXEL-RomPager and RomPager HTTP server header matches
##
# Version 0.3
# Added signatures by Andrew Horton
##
# Version 0.2 # 2011-01-09 #
# Updated model detection
##
Plugin.define "ZyXEL-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.6"
description "This plugin indentifies ZyXEL routers"
website "http://us.zyxel.com/"

# Tested on models: P-660H-D1, P-660HW-D1, P-660R-D1, P-662H-D1, P-662HW-D3, P-2602H-D1A, P-2602HW-D1A, P-2802HWL-I1, P660RU2, P660HT2, Prestige 660H61
# ZyXEL VSG-1200 V2 is access server that recognizes new users on network and re-routes all the different IP settings pre-configured on users' computers."
website "http://www.zyxel.com/"

# P-330W EE # Default Login # admin/password

# ShodanHQ results as at 2011-06-04 #
# 38,316 for WWW-Authenticate: Basic realm Prestige
# 38,311 for WWW-Authenticate: Basic realm Prestige RomPager
#  8,583 for ZyXEL-RomPager
#    422 for WWW-Authenticate: Basic realm="P-330W EE (username: admin)"

# Google results as at 2011-01-09 #
# 33 for intitle:Top "Vantage Service Gateway" -inurl:zyxel
# 90 for "Welcome to the Web-Based Configurator" "Welcome to your router Configuration Interface"

# Dorks #
dorks [
'intitle:Top "Vantage Service Gateway" -inurl:zyxel',
'"Welcome to the Web-Based Configurator" "Welcome to your router Configuration Interface"'
]



# Matches #
matches [

# Default title
{ :text=>"<title>.:: Welcome to the Web-Based Configurator::.</title><meta http-equiv='content-type' content='text/html;charset=iso-8859-1'>" },

# Default form HTML
{ :text=>'<form method="post" action="/Forms/rpAuth_1" onSubmit="LoginClick(document.forms[0].hiddenPassword, document.forms[0].LoginPassword);"><p>&nbsp;</p>' },

# Default welcome message HTML
{ :text=>'Welcome to your router Configuration Interface<p></p>Enter your password and press enter or click "Login"<p></p><img src="Images/i_key.gif" width="11" height="17"  align="absmiddle"> <strong>' },

# Model Detection # Login page HTML
{ :model=>/<td align=center><p class="style1">[\r\n\s]*([^<^\s]+)[\s]*<br \/><br \/><\/p><\/td><\/tr><tr>/ },

# Vantage Service Gateway # Default HTML
{ :text=>'<font size="3" color="3366CC" face="Arial"><b><i>Vantage Service Gateway</i>&nbsp;</b></font>', :model=>"VSG" },

# Vantage Service Gateway # Default Frameset
{ :text=>'<frameset rows="75,97%,25" framespacing="0" border="0" frameborder="0">', :model=>"VSG" },

# JavaScript
{:text=>'loginPassword.value = "ZyXEL ZyWALL Series";' },

# Vantage Service Gateway # Version Detection # /top.htm
{ :url=>"/top.htm", :model=>/<td align="right"><font size="3" color="3366CC" face="Arial"><b><i>(VSG-[\d\ V]+)<\/i>&nbsp;<\/b><\/font><\/td><\/tr>/ },

# Prestige
{:version=>/<td height="40" colspan="4" class="Auth">Prestige ([^<]+)</},
{:model=>/<td height="40" colspan="4" class="Auth">(Prestige)</},

# HTTP Server Header # ZyXEL-RomPager
{ :name=>"HTTP Server Header", :regexp=>/^ZyXEL-RomPager/, :search=>"headers[server]" },

# HTTP Server Header # ZyXEL-RomPager # Version Detection
{ :name=>"HTTP Server Header", :version=>/^ZyXEL-RomPager\/([^\s]+)$/, :search=>"headers[server]" },

# HTTP Server Header # RomPager
{ :name=>"HTTP Server Header", :regexp=>/^RomPager/, :search=>"headers[server]" },



]

# Passive #
def passive
        m=[]

	# HTTP Server Header # ZyXEL-RomPager
	if @headers["server"] =~ /^ZyXEL-RomPager/

		# Model Detection # WWW-Authenticate # Prestige
		m << { :model=>@headers["www-authenticate"].scan(/^Basic realm="(Prestige [^"]+)( Web)?"/)[0][0] } if @headers["www-authenticate"] =~ /^Basic realm="(Prestige [^"]+)( Web)?"/

		# Model Detection # WWW-Authenticate
		m << { :model=>@headers["www-authenticate"].scan(/^Basic realm="([^"^\s]+)"$/) } if @headers["www-authenticate"] =~ /^Basic realm="([^"^\s]+)"$/

	end

	# HTTP Server Header # RomPager
	if @headers["server"] =~ /^RomPager/

		# Model Detection # WWW-Authenticate # Prestige
		m << { :model=>@headers["www-authenticate"].scan(/^Basic realm="(Prestige [^"]+)( Web)?"/)[0][0] } if @headers["www-authenticate"] =~ /^Basic realm="(Prestige [^"]+)( Web)?"/

	end

	# P-330W EE # HTTP Server Header and WWW-Authenticate realm
	if @headers["www-authenticate"] =~ /Basic realm="P-330W EE \(username: admin\)"/ and @headers["server"] =~ /GoAhead-Webs/ and @status.to_s =~ /^401$/
		m << { :model=>"P-330W EE" }
	end

	# Return passive matches
        m
end

end

# An aggressive plugin could determine the module using default logo md5 hashes.
# md5 hashes are required for these images:
# { :model=>'Prestige 660H61', :url=>'/dslroutery/imgshop/full/NETZ1431.jpg' },

