##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Intrinsyc-deviceWEB" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-07-28
version "0.1"
description "Intrinsyc deviceWEB - a web server specialized for embedded devices"
website "http://www.intrinsyc.com/"

# ShodanHQ results # 2013-07-28
# 82 for Intrinsyc deviceWEB


# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Intrinsyc deviceWEB v([\d\.]+)$/ },

]

end

