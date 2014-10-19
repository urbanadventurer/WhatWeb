##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Infinet-bCX1-Controller-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "The Infinet bCX1 Controller Router (bCX1-CR-INF) is a native BACnet/IP protocol controller with a built-in web server."
website "http://plpartner.tac.com/Content?contentId=document/11984"
# Data Sheet: http://www.tac.com/data/internal/data/05/64/1177956438925/bCX1+Controller_Router+Series+Datasheet.pdf

# ShodanHQ results as at 2011-03-06 #
# 7 for bCX1-CR

# Google results as at 2011-03-06 #
# 1 for intitle:"Andover Continuum" "Controller Configuration Options" "Embedded WebServer"



# Matches #
matches [

# /Images/AndoverContinuum # Company image
{ :url=>"/Images/AndoverContinuum", :md5=>"189881eb72f08995d14ff4bd6678dfc7", :model=>"bCX1-CR-INF" },

# Controller Configuration Options link
{ :text=>'<H2><u><A HREF="/BCXMain"><font face="Arial" size="3">Controller Configuration Options</FONT></A></u></H2>', :model=>"bCX1-CR-INF" },

# Malformed Image HTML
{ :text=>'<img BORDER="0" src="/Images/taclogo" </A></H3>', :model=>"bCX1-CR-INF" },
{ :text=>'<img BORDER="0" src="/Images/AndoverContinuum"</A><P>', :model=>"bCX1-CR-INF" },

]

end


