##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TreeNeWS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-18
version "0.1"
description "Probably a 3Com Corporation or Trapeze Networks wireless access point"
# Any idea what this is? Please contact me

# ShodanHQ results as at 2011-09-18 #
# 381 for TreeNeWS

# Examples #
examples %w|
203.234.39.188
194.47.182.10
93.95.110.11
203.234.39.188
141.61.112.11
155.158.170.254
113.212.224.150
220.68.131.254
142.25.92.13
194.47.178.9
165.246.3.15
|

# Matches #
matches [

# /vendor.js
{ :url=>"/vendor.js", :string=>/var _VENDOR_ = "([^"]+)";/ },
{ :url=>"/vendor.js", :model=>/var _OTHER_SYSTEM_MANAGEMENT_NAME_ = '([^']+)';/ },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^TreeNeWS\/([^\s]+)$/ },

]

end

