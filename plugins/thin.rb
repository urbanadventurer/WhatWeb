##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "thin" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-13
version "0.1"
description "Thin is a Ruby web server that glues together 3 of the best Ruby libraries in web history: the Mongrel parser, Event Machine, and Rack - Homepage: http://code.macournoyer.com/thin/"

# ShodanHQ results as at 2012-03-13 #
# 86 for thin web server

# Examples #
examples %w|
107.20.126.11
129.130.10.12
204.236.197.164
204.236.200.77
204.236.202.217
50.17.182.119
107.20.131.66
|

# Matches #
matches [

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^thin ([^\s]+) codename (.+)$/ },

# HTTP Server Header # Server Codename
{ :search=>"headers[server]", :string=>/^thin [^\s]+ (codename .+)$/ },


]

end

