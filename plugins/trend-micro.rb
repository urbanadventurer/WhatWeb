##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Trend-Micro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-12
version "0.1"
description "Trend Micro server - http://www.trendmicro.com/"

# ShodanHQ results as at 2011-06-12 #
# 19 for Trend Micro



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Trend Micro$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^Trend Micro ([^\s]+)$/ },

]

end

