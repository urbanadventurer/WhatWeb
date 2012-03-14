##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mobile-Joomla" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-15
version "0.1"
description "Mobile Joomla - Homepage: http://www.mobilejoomla.com/"

# ShodanHQ results as at 2011-03-13 #
# 70 for mjmarkup

# Examples #
examples %w|
124.146.198.50
130.123.179.171
200.11.217.83
67.228.59.206
87.98.185.33
84.22.152.19
184.168.105.193
182.163.94.1
212.174.72.188
|

# Matches #
matches [

# Set-Cookie # mjmarkup=deleted;
{ :search=>"headers[set-cookie]", :regexp=>/mjmarkup=deleted;/ },

]

end

