##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RCTTools" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-11
version "0.1"
description "RCTTools - SecureSOHO Web configuration Tools"
website "[offline] http://www.redsonic.com/"

# ShodanHQ results as at 2012-04-11 #
# 1,394 for RCTTools (SecureSOHO Web configuration Tools)



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^RCTTools \(SecureSOHO Web configuration Tools\) v([^\s]+)$/ },

]

end

