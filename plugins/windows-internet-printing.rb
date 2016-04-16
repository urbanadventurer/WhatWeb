##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Windows-Internet-Printing" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.1"
description "Windows internet printing web frontend"
website "http://www.microsoft.com/"
# More info: http://support.microsoft.com/kb/313058

# 4 results for inurl:Printers/ipp_0001.asp @ 2010-07-22
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1568


matches [

{ :ghdb=>'inurl:Printers/ipp_0001.asp' },

{ :text=>'        <td width="12%"><img src="images/ipp_0002.gif" alt="printers.gif"></td>' },

{ :text=>'      <tr><td bgcolor=#000000 nowrap><font  face="Tahoma, Verdana, Arial, MS Sans Serif"  size=2 color=white><b>Name&nbsp;&nbsp;</b></font></td><td bgcolor=#000000 nowrap><font  face="Tahoma, Verdana, Arial, MS Sans Serif"  size=2 color=white><b>Status&nbsp;&nbsp;</b></font></td><td bgcolor=#000000 nowrap><font  face="Tahoma, Verdana, Arial, MS Sans Serif"  size=2 color=white><b>Location&nbsp;&nbsp;</b></font></td><td bgcolor=#000000 nowrap><font  face="Tahoma, Verdana, Arial, MS Sans Serif"  size=2 color=white><b>Jobs&nbsp;&nbsp;</b></font></td><td bgcolor=#000000 nowrap><font  face="Tahoma, Verdana, Arial, MS Sans Serif"  size=2 color=white><b>Model&nbsp;&nbsp;</b></font></td><td bgcolor=#000000 nowrap><font  face="Tahoma, Verdana, Arial, MS Sans Serif"  size=2 color=white><b>Comment&nbsp;&nbsp;</b></font></td></tr><tr><td nowrap><font  face="Tahoma, Verdana, Arial, MS Sans Serif"  size=2>' },

]


end

