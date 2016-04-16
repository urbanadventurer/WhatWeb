##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fujitsu-InfoProvider-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Fujitsu-InfoProvider-Pro web server"
website "http://software.fujitsu.com"

# ShodanHQ results as at 2011-02-24 #
# 188 for Fujitsu-InfoProvider-Pro



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/Fujitsu-InfoProvider-Pro/ },

# Version Detection
{ :search=>"headers[server]", :version=>/Fujitsu-InfoProvider-Pro\/[V]?([^ ]+) / },

]

end

