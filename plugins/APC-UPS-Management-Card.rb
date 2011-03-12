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

# 6,524 for APC Management Card realm
# 2,064 for APC Management Card -realm

# Examples #
examples %w|
211.175.7.253
150.46.30.33
208.91.5.254
216.241.137.124
69.67.215.104
64.71.18.98
213.215.48.43
209.47.92.124
193.34.148.20
216.24.174.80
178.237.35.251
222.255.28.153
219.123.41.230
219.122.60.126
218.237.53.171
217.23.1.5
|

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
	m << { :name=>"WWW-Authenticate realm" } if @meta["www-authenticate"] =~ /^Basic realm="APC Management Card"$/

	# Return passive matches
	m
end

end


