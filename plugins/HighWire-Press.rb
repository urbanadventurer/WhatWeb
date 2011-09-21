##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HighWire-Press" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-21
version "0.1"
description "HighWire Press hosting - Homepage: http://highwire.stanford.edu/about/"

# ShodanHQ results as at 2011-09-21 #
# 1,886 for X-Highwire
#   302 for X-Firenze

# Examples #
examples %w|
171.67.113.25
171.67.122.102
171.67.117.60
171.66.124.18
171.67.118.156
171.67.119.139
171.67.117.217
171.67.123.181
171.67.122.225
171.67.112.70
167.216.165.174
|

# Matches #
matches [

# HTTP Headers
{ :search=>"headers[x-firenze-processing-time]", :regexp=>/^[\d\.]+$/ },
{ :search=>"headers[x-firenze-processing-tims]", :regexp=>/^detect-robot:/ },
{ :search=>"headers[x-highwire-sessionid]", :regexp=>/^.+$/ },

]

end

