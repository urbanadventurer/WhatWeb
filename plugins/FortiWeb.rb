##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FortiWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-14
version "0.1"
description "The FortiWeb family of Web application and XML firewalls protect, balance, and accelerate Web applications, databases, and the information exchanged between them. - Homepage: http://www.fortinet.com/products/fortiweb/"

# ShodanHQ results as at 2011-05-14 #
# 985 for FortiWeb

# Examples #
examples %w|
83.111.115.199
209.87.230.134
114.31.240.205
84.15.11.78
207.207.43.17
212.72.22.121
173.167.4.194
194.14.58.35
|

# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^FortiWeb$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^FortiWeb-([\d\.]+)$/ },

]

end

