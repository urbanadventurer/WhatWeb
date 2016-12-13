##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Linksys-Wireless-G-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "Linksys Wireless-G Camera web interface"
website "http://www.linksys.com/"

# 40 Google results for inurl:/img/vr.htm @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1591


matches [

{ :text=>'<title>Linksys Wireless-G Internet-Videokamera</title>' },

{ :text=>'<title>Linksys Wireless-G Internet Video Camera</title>' },

{ :text=>'<body bgcolor="#ffffff" marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" onload="parent.chkRefresh(\'vr\')"> </body>' },

]


end

