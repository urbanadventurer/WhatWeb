##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SonicWALL-SSL-VPN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "SonicWALL SSL-VPN Portal provides secure Internet access for remote users to log in and access private network resources via SSL-VPN technology. "
website "http://www.sonicwall.com/"

# ShodanHQ results as at 2011-03-13 #
# 11,960 for SonicWALL SSL-VPN Web Server



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^SonicWALL SSL-VPN Web Server\.?$/ },

]

end

