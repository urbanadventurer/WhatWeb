##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MJNioHttpDaemon" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-14
version "0.1"
description "MJNioHttpDaemon"
# Any idea who makes this? Please contact me

# ShodanHQ results as at 2011-09-14 #
# 12 for MJNioHttpDaemon
# 12 for MJNIOHTTPDSESSIONID

# Examples #
examples %w|
unitedjoy.com
216.67.236.253
216.67.236.250
72.232.207.186
72.232.178.42
65.98.57.164
207.150.167.70
72.233.90.162
72.233.112.42
72.232.218.74
72.233.34.218
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^MJNioHttpDaemon\/([^\s]+)/ },

# MJNIOHTTPDSESSIONID Cookie
{ :search=>"headers[set-cookie]", :regexp=>/MJNIOHTTPDSESSIONID=/ },

]

end

