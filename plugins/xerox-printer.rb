##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-09-17 #
# Updated Phaser model/version/firmware detection
##
# Version 0.2 # 2011-02-25 #
# Updated model detection
##
Plugin.define "Xerox-Printers" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "Xerox printers web interface"
website "http://www.xerox.com/"

# ShodanHQ results as at 2011-09-16 #
# 710 for xerox Phaser -Authenticate

# Google results as at 2010-07-22 #
# 28 for "Phaser 6250" "Printer Neighborhood" "XEROX CORPORATION" -intitle
# 25 for intext:centreware inurl:status
# 7 for inurl:"properties/aboutPrinter.html" intitle:"About Printer - Xerox Phaser"

# Dorks #
dorks [
'"Phaser 6250" "Printer Neighborhood" "XEROX CORPORATION" -intitle',
'inurl:"properties/aboutPrinter.html" intitle:"About Printer - Xerox Phaser"',
'intext:centreware inurl:status'
]



# Matches #
matches [

# Phaser 6250DP
{ :certainty=>25, :text=>'Phaser 6250DP</title>', :model=>"Phaser 6250DP" },
{ :certainty=>25, :text=>'Phaser 6250N</title>', :model=>"Phaser 6250N" },

# Phaser 3300MFP
{ :model=>/<title> Home - Xerox (Phaser 3300MFP) <\/title>/ },

# Model Detection # Phaser # /properties/aboutprinter.html
{ :url=>"/properties/aboutprinter.html", :model=>/<title> About Printer - Xerox (Phaser [^\s]+) <\/title>/ },
{ :url=>"/properties/aboutPrinter.html", :model=>/<title> About Printer - Xerox (Phaser [^\s]+) <\/title>/ },

# Firmware Version Detection # Phaser # /properties/aboutprinter.html
{ :url=>"/properties/aboutprinter.html", :firmware=>/<tr>[\s]+<td width=60%>(Firmware Version OS|Operating System) <\/td>[\s]+<td width=40%>(OS | )?([^<]+)<\/td>[\s]+<\/tr>/, :offset=>2 },
{ :url=>"/properties/aboutPrinter.html", :firmware=>/<tr>[\s]+<td width=60%>(Firmware Version OS|Operating System) <\/td>[\s]+<td width=40%>(OS | )?([^<]+)<\/td>[\s]+<\/tr>/, :offset=>2 },

# NIC Firmware Version Detection # Phaser # /properties/aboutprinter.html
{ :url=>"/properties/aboutprinter.html", :firmware=>/<tr>[\s]+<td width=60%>(Networking|NIC Firmware Version)<\/td>[\s]+<td width=40%>([^<]+)<\/td>[\s]+<\/tr>/, :offset=>1 },
{ :url=>"/properties/aboutPrinter.html", :firmware=>/<tr>[\s]+<td width=60%>(Networking|NIC Firmware Version)<\/td>[\s]+<td width=40%>([^<]+)<\/td>[\s]+<\/tr>/, :offset=>1 },

# Version Detection # Phaser # /properties/aboutprinter.html
{ :url=>"/properties/aboutprinter.html", :version=>/<tr>[\s]+<td width=60%>IP Core Software Version<\/td>[\s]+<td width=40%>([^<]+)<\/td>[\s]+<\/tr>/ },
{ :url=>"/properties/aboutPrinter.html", :version=>/<tr>[\s]+<td width=60%>IP Core Software Version<\/td>[\s]+<td width=40%>([^<]+)<\/td>[\s]+<\/tr>/ },

# DocuPrint N2125
{ :text=>'	<br><font class=s4 face="Arial,Helvetica" size=4 color="#0000FF"><b><font size=4>&nbsp;&nbsp;&nbsp;&nbsp;</font>DocuPrint N2125</b></font></td>', :model=>"DocuPrint N2125" },

# Phaser 4500DT
{ :text=>'                              color=#008000 face="Arial,Helvetica" size=2>Phaser 4500DT</font></td>', :model=>"Phaser 4500DT" },

# Phaser 7700DN
{ :text=>'<td valign=top width=85><font class=s2 face="Arial,Helvetica" size=2 color="#008000"> Phaser 7700DN </font></td>', :model=>"Phaser 7700DN" },

# Phaser 8400DP-1
{ :text=>'                              color=#008000 face="Arial,Helvetica" size=2>Phaser 8400DP-1</font></td>', :model=>"Phaser 8400DP-1" },

# Model Detection # Default Title
{ :model=>/<title>(FX[0-9A-Z]{6})-Home<\/title>/ },

]

end

