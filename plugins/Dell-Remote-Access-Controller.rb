##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-06-04 #
# Updated Version Detection
# Added internal IP detection
##
Plugin.define "Dell-Remote-Access-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.2"
description "Dell Remote Access Controller or DRAC, an interface card from Dell Inc, provides out-of-band management facilities. The controller has its own processor, memory, network connection, and access to the system bus. Key features include power management, virtual media access and remote console capabilities, all available through a supported web browser or command line interface. - Homepage: http://www.dell.com/content/topics/global.aspx/power/en/ps2q02_bell?c=us&l=en"
# Documentation: http://support.dell.com/support/edocs/software/smdrac3/
# More Info: http://en.wikipedia.org/wiki/Dell_DRAC
# Default Login: root/calvin

# ShodanHQ results as at 2012-06-04 #
# 10,485 for RAC_ONE_HTTP
#  5,317 for Dell Remote Access Controller

# Examples #
examples %w|
206.99.95.44
209.48.82.6
69.17.70.93
78.140.145.189
122.201.101.15
89.17.202.54
85.17.154.134
212.61.145.140
80.237.159.161
87.233.217.66
68.236.196.235
92.51.187.233
38.113.6.62
82.147.22.83
195.8.182.245
206.128.80.155
80.93.92.134
202.3.143.58
70.86.63.150
|

# Matches #
matches [

# Version Detection # JavaScript Required message
{ :version=>/<span class="data-area-page-title">The DRAC ([\d\.]+) Web-based interface requires JavaScript to display content correctly\.<\/span>/ },

# /index.html # Redirect Page # md5sum
{ :url=>"/index.html", :md5=>"3fbe4d5548bdfcdf7cb98286380e9c20" },

# /cgi-bin/webcgi/ssologin # 5.x # Internal IP Detection
{ :url=>"/cgi-bin/webcgi/ssologin", :string=>/<CARD_IP>([^\s]+)<\/CARD_IP>/, :version=>"5" },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^RAC_ONE_HTTP ([\d\.]+)$/ },

]

end

