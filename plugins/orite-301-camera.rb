##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ORITE-301-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-15
version "0.1"
description "Orite IC301 web cam interface"

# 16 results for intitle:"Orite IC301" | intitle:"ORITE Audio IP-Camera IC-301" -the -a @ 2010-07-15

# Dorks #
dorks [
'intitle:"Orite IC301" | intitle:"ORITE Audio IP-Camera IC-301" -the -a'
]



matches [

{ :text=>'	<TITLE>ORITE Audio IP-Camera IC-301 </TITLE>' },

{ :text=>'<TITLE>Orite IC301</TITLE>' },

{ :text=>'	var s=\'<frameset cols="220, *" id=totalframeset frameborder="NO" border="0" framespacing="0" noresize>\'' },

]


end

