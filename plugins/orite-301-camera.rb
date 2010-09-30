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

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1458
# 16 results for intitle:"Orite IC301" | intitle:"ORITE Audio IP-Camera IC-301" -the -a @ 2010-07-15
examples %w|
88.247.195.215:83
88.250.175.101:75
81.70.232.167
wildkatent.homeip.net:50174
www.wisdomwell.com.hk/pda.htm
cscheung.com/pda.htm
offercom.xs4all.nl:8008
|

matches [

{ :text=>'	<TITLE>ORITE Audio IP-Camera IC-301 </TITLE>' },

{ :text=>'<TITLE>Orite IC301</TITLE>' },

{ :text=>'	var s=\'<frameset cols="220, *" id=totalframeset frameborder="NO" border="0" framespacing="0" noresize>\'' },

]


end

