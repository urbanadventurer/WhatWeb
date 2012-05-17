##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Content-Security-Policy" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-17
version "0.1"
description "X-Content-Security-Policy - Content Security Policy (CSP) HTTP header."

# ShodanHQ results as at 2012-05-17 #
# 785 for X-Content-Security-Policy

# Examples #
examples %w|
92.87.29.133
94.23.161.137
211.25.206.103
176.9.85.208
217.188.61.53
77.232.230.138
211.232.22.203
178.63.5.29
|

# Matches #
matches [

# X-Content-Security-Policy # HTTP Server Header
{ :search=>"headers[x-content-security-policy]", :string=>/^(.*)$/ },

]

end

