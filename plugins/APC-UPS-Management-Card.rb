##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "APC-UPS-Management-Card" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-12
version "0.1"
description "APC UPS Network Management Cards allow for secure monitoring and control of an individual APC UPS via web browser, command line interface, or SNMP. - Homepage: http://www.apc.com/products/family/index.cfm?id=98"

# ShodanHQ results as at 2011-03-12 #
# 6,524 for APC Management Card realm
# 2,064 for APC Management Card -realm



# Matches #
matches [

# Logo Link
{ :text=>'<td class="apclogo"><a href="http://www.apc.com"><img src="images/smapc.gif" alt="APC Website" width="59" height="17" border="0" align="top" /></a>&nbsp;&nbsp;</td>' },

# HTTPS Required
{ :url=>"/RpError/SslRequired", :text=>'<td>This object on the&nbsp;APC Management Web Server&nbsp;is protected and requires a secure socket connection.<br /><br /><br /><br /><A HREF="https://' },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate
	m << { :name=>"WWW-Authenticate realm" } if @headers["www-authenticate"] =~ /^Basic realm="APC Management Card"$/

	# Return passive matches
	m
end

end


