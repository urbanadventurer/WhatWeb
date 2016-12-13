##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HighWire-Press" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-21
version "0.1"
description "HighWire Press hosting"
website "http://highwire.stanford.edu/about/"

# ShodanHQ results as at 2011-09-21 #
# 1,886 for X-Highwire
#   302 for X-Firenze



# Matches #
matches [

# HTTP Headers
{ :search=>"headers[x-firenze-processing-time]", :regexp=>/^[\d\.]+$/ },
{ :search=>"headers[x-firenze-processing-tims]", :regexp=>/^detect-robot:/ },
{ :search=>"headers[x-highwire-sessionid]", :regexp=>/^.+$/ },

]

end

