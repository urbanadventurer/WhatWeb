##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ethProxy"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-13
]
version "0.1"
description "ethProxy DDoS (Distributed Denial of Service) Proxy solution offers full DDoS protection for a wide-range of HTTP-based attacks without changing providers. Web traffic is filtered through the ethProxy systems and routed back to your host."
website "http://www.ethproxy.com/"

# ShodanHQ results as at 2011-05-13 #
# 80 for ethProxy



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^ethProxy$/ },

]

end

