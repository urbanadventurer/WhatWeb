##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ericsson-TV-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "Ericsson Integrated Receiver Decoders - web interface"
website "http://www.ericsson.com/ourportfolio/products/integrated-receiver-decoders?nav=fgb_101_348|fgb_101_749"

# ShodanHQ results as at 2011-05-30 #
# 5 for Ericsson Television Web server



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server ]", :regexp=>/^Ericsson Television Web server$/ },

]

end

