##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Level1-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-12
version "0.1"
description "Level1 Router - Homepage: http://uk.level1.com/"

# Google results as at 2012-02-12 #
# 3 for intitle:"WBR" intitle:"Wireless Broadband NAT Router Web-Console"

# Dorks #
dorks [
'intitle:"WBR" intitle:"Wireless Broadband NAT Router Web-Console"'
]

# Examples #
examples %w|
86.110.36.60
87.69.198.216
46.120.202.251
87.69.20.239
46.120.46.150
85.64.100.10
84.94.64.90
124.244.122.229
80.179.213.209
85.65.123.157
84.94.69.170
194.90.189.224
84.108.150.162
85.65.224.87
84.94.56.248
62.90.36.98
87.69.46.253
87.69.190.6
46.117.119.218
46.120.203.216
87.69.207.153
85.64.235.224
80.179.30.248
87.69.107.146
87.69.5.134
87.69.122.74
84.108.218.152
85.64.183.228
|

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

