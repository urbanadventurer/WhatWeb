##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Avaya-Aura-Utility-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Avaya Aura Utility Server - Homepage: http://www.avaya.com/"

# Examples #
examples %w|
168.36.31.12
169.236.80.153
61.59.26.92
187.141.175.163
168.47.116.11
74.254.147.142
168.47.118.12
168.47.20.11
66.192.212.62
193.12.23.13
168.38.164.4
203.67.232.132
|

# Matches #
matches [

# / # span class="vmsTitle"
{ :text=>'<span class="vmsTitle">Avaya Aura&#8482;&nbsp;Utility Server</span>' },

# / # help link
{ :text=>'<div id="topBar"><div id="topBarLeft"><a href="#" class="helpAndExit" onclick="window.open(\'/webhelp/Base/Utility_toc.htm' },

]

end

