##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Content-Security-Policy" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-17
version "0.1"
description "Content Security Policy (CSP) - More Info: https://en.wikipedia.org/wiki/Content_Security_Policy"

# ShodanHQ results as at 2012-05-17 #
# 785 for X-Content-Security-Policy



# Matches #
matches [

# X-Content-Security-Policy # HTTP Server Header
{ :search=>"headers[x-content-security-policy]", :string=>/^(.*)$/ },

# X-WebKit-CSP # HTTP Server Header
{ :search=>"headers[x-webkit-csp]", :string=>/^(.*)$/ },

]

end

