##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VPON" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "Video Picture on Net (VPON) is a remote video web server - Homepage: http://www.vpon21.com/"
# Default login: webmonitor/oyo

# Google results as at 2011-04-20 #
# 5 for inurl:"start.htm?scrw="

# ShodanHQ results as at 2011-04-20 #
# 256 for VPON Server

# Dorks #
dorks [
'inurl:"start.htm?scrw="'
]

# Examples #
examples %w|
www.vpondemo.com
61.222.188.36
67.114.225.11
24.237.136.106
60.250.141.76
211.72.2.235
206.130.132.39
210.243.207.108
220.130.246.21
220.128.129.225
80.13.229.105
|

# Matches #
matches [

# Version Detection # /ctrl_ver.js
{ :url=>"/ctrl_ver.js", :version=>/^var live_video_control_version ="([^"]+)";/ },

# Model Detection # /ctrl_ver.js
{ :url=>"/ctrl_ver.js", :model=>/^var vpon_platform = "([^"]+)";/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @headers["server"] =~ /^VPON Server\/[\d\.]+$/

	# Return passive matches
	m

end

end

