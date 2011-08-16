##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Unimep-Station-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-16
version "0.1"
description "Mepsan fuel pump controller - Homepage: http://www.mepsan.com.tr/eng/index.htm"

# Google results as at 2011-08-16 #
# 30 results for intitle:"UniMep Station Controller"

# Dorks #
dorks [
'intitle:"UniMep Station Controller"'
]

# Examples #
examples %w|
78.187.36.71
78.187.18.239
88.247.192.49
78.186.19.86
88.247.35.162
88.247.51.10
78.186.113.115
88.248.245.54
95.15.71.147
88.247.21.215
88.250.225.132
88.232.192.55
ayhanbaynal.com
78.187.18.239
|

# Matches #
matches [

# Meta Description
{ :text=>'<META Name="Description" Content="UniMep Station Controller">' },

# USC Version link
{ :text=>'<center><a href="cgi-bin/usc.ver.cgi">USC&nbsp;Version</a>' },

# MAC Address
{ :string=>/<TITLE>([A-F:\d]{17}) UniMep Station Controller<\/TITLE>/ },

# Log link
{ :text=>'<a href="cgi-bin/log.log.cgi" target="_blank">Log1.cgi</a>&nbsp;<a href="/Log.log" target="_blank">Log1.log</a>' },

# Cashier link
{ :text=>"<input type='button' value='Cashier' onclick=\"window.open('/cgi-bin/cashier.cgi?usc_ip=" },

]

end

