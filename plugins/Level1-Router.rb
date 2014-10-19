##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Level1-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-12
version "0.1"
description "Level1 Router"
website "http://uk.level1.com/"

# Google results as at 2012-02-12 #
# 3 for intitle:"WBR" intitle:"Wireless Broadband NAT Router Web-Console"

# Dorks #
dorks [
'intitle:"WBR" intitle:"Wireless Broadband NAT Router Web-Console"'
]



# Matches #
matches [

# Frameset # Title # Model Detection
{ :model=>/<TITLE>(WBR-[^\s]+) Wireless Broadband NAT Router Web-Console<\/TITLE>/ },

# /status.htm
{ :url=>"/status.htm", :string=>/<!--TR><TD>MAC Address<\/TD><TD ALIGN=CENTER COLSPAN=2>([A-F\d\-]{17})<\/TD><\/TR-->/ },

# /bg_logo1.jpg
{ :url=>"/bg_logo1.jpg", :md5=>"b78c9744264dadba05ba0d00d62a97b6" },

# HTML Comment
{ :certainty=>25, :text=>'<!---CAS:0003--><HTML>' },

]

end

