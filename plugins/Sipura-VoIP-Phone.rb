##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sipura-VoIP-Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-10
version "0.1"
description "Sipura VoIP phone. Cisco Systems acquired Sipura Technologies for its Linksys division in 2005. - Homepage: http://www.sipura.net/"

# Google results as at 2011-04-10 #
# 42 for intitle:"Sipura SPA Configuration" inurl:admin
# 40 for intitle:"Sipura SPA Configuration" inurl:admin -ext:htm
# 19 for intitle:"Sipura SPA Configuration" inurl:admin "Call History" -ext:htm

# Examples #
examples %w|
www.rikasakha.ru:8085/admin/
213.147.44.84/admin/
echozoe.blogdns.com/admin/
www.abreumendes.net/admin/
200.60.62.128/admin/
90-156-4-90.as.kn.pl/admin/
ip99.elektrosat.pl/admin/
87-207-172-198.dynamic.chello.pl/admin/
|

# Matches #
matches [

# Form HTML with unique file extension
{ :text=>'<form action="bsipura.spa" method="POST">' },

# Image HTML
{ :text=>'<img width="100%" src="/spabanner.jpg" border="0" alt="Sipura Technology Inc">' },

# Model Detection
{ :model=>/<tr bgcolor="#dcdcdc"><td>Product Name:<td><font color="darkblue">([^<]+)<\/font><td>Serial Number:<td>/ },

# Version Detection
{ :version=>/<tr bgcolor="#d3d3d3"><td>Software Version:<td><font color="darkblue">([^<]+)<\/font><td>Hardware Version:<td><font color="darkblue">[^<]+<\/font>/ },

# Firmware Version Detection
{ :firmware=>/<tr bgcolor="#d3d3d3"><td>Software Version:<td><font color="darkblue">[^<]+<\/font><td>Hardware Version:<td><font color="darkblue">([^<]+)<\/font>/ },

# MAC Address Detection
{ :string=>/<tr bgcolor="#dcdcdc"><td>MAC Address:<td><font color="darkblue">([A-F\d]{12})<\/font><td>Client Certificate:<td>/ },

# Call History Detection
{ :module=>/<\/font><a href="\/calllog\.htm" target=_calllog_[\d]+><font class=swalft>(Call History)<\/font><\/a><\/p><\/div>/ },

# Extract Addressbook Details
{ :url=>"/pdir.htm", :string=>/<td>[\d]+\.<td>&nbsp;<input class="inputc" size="40" name="[\d]+" value="(n=[^;]*;p=[\d]+)" maxlength=[\d]+>/ },

]

end


