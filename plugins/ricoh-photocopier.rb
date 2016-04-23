##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ricoh-Photocopier" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-08
version "0.1"
description "Ricoh photocopier web interface"
website "http://www.ricoh.com/"

# ShodanHQ results as at 2011-08-08 #
# 16,004 for CookieOnOffChecker
# 15,983 for CookieOnOffChecker Web-Server



# Matches #
matches [

# JavaScript Disabled Page
{ :text=>'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="background:url(/images/settingDivision.gif) repeat-x bottom;">' },

# Redirect Page
{ :text=>'<meta http-equiv="refresh" content="1; URL=/web/guest/en/websys/webArch/message.cgi?messageID=MSG_JAVASCRIPTOFF&buttonURL=/../../../">' },

# Model Detection # /web/guest/en/websys/webArch/header.cgi
{ :url=>"/web/guest/en/websys/webArch/header.cgi", :model=>/<span class="modelName">([^<]+)<\/span>/ },

# Model Detection # /web/guest/en/websys/webArch/topPage.cgi
{ :url=>"/web/guest/en/websys/webArch/topPage.cgi", :model=>/<td nowrap align="">Device Name<\/td>[\s]+<td nowrap>:<\/td>[\s]+<td nowrap>([^<]+)<\/td>/ },

# Host Name Detection # /web/guest/en/websys/webArch/topPage.cgi
{ :url=>"/web/guest/en/websys/webArch/topPage.cgi", :string=>/<td nowrap align="">Host Name<\/td>[\s]+<td nowrap>:<\/td>[\s]+<td nowrap>([^\s^<]+)<\/td>/ },

# MAC Address Detection 
{ :url=>"/web/guest/en/websys/netw/getInterface.cgi", :string=>/<td (xmlns:axsl="[^"]+" )?nowrap align="left" width="150">MAC Address<\/td>[\s]+<td xmlns:axsl="http:\/\/localhost" nowrap>:<\/td>[\s]+<td nowrap>([^\s^<]+)<\/td>/, :offset=>1 },

# Model Detection # /web/guest/en/websys/status/configuration.cgi
{ :url=>"/web/guest/en/websys/status/configuration.cgi", :model=>/<td nowrap align="">Model Name<\/td>[\s]+<td nowrap>:<\/td>[\s]+<td nowrap>([^<]+)<\/td>/ },

# Extract Total Memory # /web/guest/en/websys/status/configuration.cgi
{ :url=>"/web/guest/en/websys/status/configuration.cgi", :string=>/<td nowrap align="left">Total Memory<\/td>[\s]+<td nowrap>:<\/td>[\s]+<td nowrap>([^\s^<]+)<\/td>/ },

]

# Passive #
def passive
	m=[]

	# cookieOnOffChecker Cookie
	if @headers["set-cookie"] =~ /^cookieOnOffChecker=on;/
		m << { :name=>"cookieOnOffChecker Cookie" }
	end

	# Return passive matches
	m
end
end

