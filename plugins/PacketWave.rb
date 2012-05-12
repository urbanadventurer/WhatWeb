##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PacketWave" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-11
version "0.1"
description "Some sort of wireless broadband contraption from Aperto Networks - Homepage: http://www.apertonet.com/products/pmax_productline.html"

# ShodanHQ results as at 2011-05-11 #
# 73 for PacketWave

# Examples #
examples %w|
83.96.122.33
59.165.160.49
83.96.85.73
83.96.24.103
64.71.4.196
69.71.88.5
83.96.123.66
|

# Matches #
matches [

# input button # goto
{ :text=>'<td bgcolor="#cccccc" colspan=2 align="center"><input type="button" name="goto" value="Log On" onClick="encode_submit(this.form)">' },

]

end

