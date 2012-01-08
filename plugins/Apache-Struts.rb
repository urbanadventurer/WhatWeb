##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache-Struts" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-08
version "0.1"
description "The Apache Struts web framework is a free open-source solution for creating Java web applications. - Homepage: https://struts.apache.org/"

# ShodanHQ results as at 2012-01-08 #
# 7 for org.apache.struts

# Examples #
examples %w|
63.237.220.171
211.34.86.65
63.236.32.62
204.236.130.47
63.237.220.31
63.237.220.94
63.146.118.181
|

# Matches #
matches [

# Set-Cookie # org.apache.struts.action.LOCALE
{ :search=>"headers[set-cookie]", :regexp=>/org\.apache\.struts\.action\.LOCALE=[^\s]+;/ },

# Set-Cookie # org.apache.struts.*
{ :search=>"headers[set-cookie]", :regexp=>/org\.apache\.struts\.[^\s]+=[^\s]+;/, :certainty=>75 },

]

end

