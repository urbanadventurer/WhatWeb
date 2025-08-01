##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Content-Security-Policy"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2012-05-17
  "Andrew Horton", # v0.2 # 2025-08-02 # Added modern CSP header detection
]
version "0.2"
description "Content Security Policy (CSP) helps prevent XSS attacks by restricting which resources can be loaded."
website "https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP"

# ShodanHQ results as at 2012-05-17 #
# 785 for X-Content-Security-Policy



# Matches #
matches [

# X-Content-Security-Policy # HTTP Server Header
{ :search=>"headers[x-content-security-policy]", :string=>/^(.*)$/ },

# X-WebKit-CSP # HTTP Server Header
{ :search=>"headers[x-webkit-csp]", :string=>/^(.*)$/ },

# Modern CSP headers
{ :search=>"headers[content-security-policy]", :string=>true, :name=>"CSP Header" },
{ :search=>"headers[content-security-policy-report-only]", :string=>true, :name=>"CSP Report-Only Header" },

]

end

