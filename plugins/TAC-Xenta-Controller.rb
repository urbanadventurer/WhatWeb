##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TAC-Xenta-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "SCADA - The TAC Xenta devices are multifunctional control systems with an embedded web server that allows you to access your control application and configuration pages via a web browser anywhere in the world, anytime. - Homepage: http://www.tac.com/ap/Navigate?node=1656"



# Matches #
matches [

# Home Page # Default HTML
{ :text=>'<html><body><script>var url="https://"+location.hostname+"/www/index/Slogin.html";location.href=url;</script></body></html>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^TAC\/Xenta([\d]{3}|[\d]{3}-[A-Z]{3}) [\d\.]{4}/
		m << { :model=>@headers["server"].scan(/^TAC\/Xenta([\d]{3}|[\d]{3}-[A-Z]{3}) [\d\.]{4}/) }
		m << { :firmware=>@headers["server"].scan(/^TAC\/Xenta[^\ ]+ ([\d\.]{4})/) }
	end

	# Return passive matches
	m
end

end


