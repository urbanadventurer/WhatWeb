##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HttpFileServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "You can use HFS (HTTP File Server) to send and receive files. Access your remote files, over the network. - Homepage: http://www.rejetto.com/hfs/"

# ShodanHQ results as at 2011-05-30 #
# 5,253 for HFS

# Google results as at 2011-05-30 #
# 626 for "File List" "Folder archive" "HttpFileServer" "Servertime" "Uptime"
# 642 for "File List" "Folder archive" "HttpFileServer" "Servertime" "Uptime" "Build-time"
# 636 for "File List" "Folder archive" "HttpFileServer" "Servertime" "Uptime" "Build-time" intitle:HFS

# Dorks #
dorks [
'"File List" "Folder archive" "HttpFileServer" "Servertime" "Uptime" "Build-time" intitle:HFS'
]

# Examples #
examples %w|
87.69.132.38
81.218.140.90
84.109.79.172
80.179.242.125
86.21.40.206
188.226.108.188
209.250.240.231
91.200.228.253
78.130.220.205
www.fhms.edu.hk:280
ip-120-125-86-21.mcu.edu.tw
olechinese.ouhk.edu.hk
www.raps.matsu.edu.tw:8080
omo.oc.ntu.edu.tw:8080
el.iim.nctu.edu.tw
eoiclab.nfu.edu.tw
cc5-051.niu.edu.tw
pcc2.ee.oit.edu.tw:8080
omo.oc.ntu.edu.tw:8080
eoiclab.nfu.edu.tw
file.hses.tyc.edu.tw
kct.ee.ncut.edu.tw
imagepc6.cm.nctu.edu.tw
|

# Matches #
matches [

# Version Detection # Footer
{ :version=>/<div id=footer>[\s]+<a href="http:\/\/www\.rejetto\.com\/hfs\/">HttpFileServer ([^<]+)<\/a>[\s]+<br \/>Servertime/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^HFS (\d\.\d.+)$/) } if @headers["server"] =~ /HFS (\d\.\d.+)$/

	# Return passive matches
	m
end

end

