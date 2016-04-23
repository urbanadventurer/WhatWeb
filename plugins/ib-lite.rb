##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IB-Lite" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-23
version "0.1"
description "ComAp IB-Lite - Internet / Ethernet Module including Web Server - Plug-in communication module for IL-NT, IC-NT, IA-NT and ID-Lite controllers and their clones."
website "http://www.comap.cz/products/detail/ib-lite/"

# Google results as at 2011-09-23 #
# 2 for "IB-Lite" "Firmware version" "Bootloader version"

# Dorks #
dorks [
'"IB-Lite" "Firmware version" "Bootloader version"'
]



# Matches #
matches [

{ :text=>'<tr class="w_r"><td class="w_n">Access code</td><td width="140" class="w_v"><input id="psw_id" type="password" maxLength="15" size="20" name="q" value=""></td></tr>' },

]

# Passive #
def passive
	m=[]

	# Firmware / Bootloader Detection
	if @body =~ /<p class="v">Firmware version ([^&^\s^<]+)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Bootloader) version ([^&^\s^<]+)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[^<]*&copy ComAp&nbsp; ([\d]{1,2}\.[\d]{1,2}\.[\d]{4})<\/p>/
		m << { :firmware=>"#{$1}" }
		m << { :string=>"#{$2}/#{$3}" }
	end

	# Return passive matches
	m
end
end

