##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "x-hacker" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-20
version "0.1"
description "This plugin identifies the x-hacker header and extracts its value."

# ShodanHQ results as at 2011-09-20 #
# 27 for x-hacker

# Examples #
examples %w|
66.197.78.199
173.203.96.175
202.87.34.134
72.52.210.91
|

# Matches #
matches [

# x-hacker
{ :search=>"headers[x-hacker]", :string=>/^(.+)$/ },

]

end

