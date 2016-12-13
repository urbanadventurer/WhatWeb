##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Xavante" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Xavante is a Lua HTTP 1.1 Web server that uses a modular architecture based on URI mapped handlers."
website "http://keplerproject.github.com/xavante/"

# ShodanHQ results as at 2012-08-26 #
# 143 for Xavante



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Xavante (.+)$/ },

]

end

