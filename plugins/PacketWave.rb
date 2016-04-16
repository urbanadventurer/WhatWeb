##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PacketWave" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-11
version "0.1"
description "Some sort of wireless broadband contraption from Aperto Networks"
website "http://www.apertonet.com/products/pmax_productline.html"

# ShodanHQ results as at 2011-05-11 #
# 73 for PacketWave



# Matches #
matches [

# input button # goto
{ :text=>'<td bgcolor="#cccccc" colspan=2 align="center"><input type="button" name="goto" value="Log On" onClick="encode_submit(this.form)">' },

]

end

