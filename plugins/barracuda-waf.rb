##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.1 # 2015-11-09 #
##
Plugin.define "Barracuda-Waf" do
author "Guillaume Delacour <gui@iroqwa.org>"
version "0.1"
description "Barracuda Web Application Firewall: Security and DDoS Protection Against Automated & Targeted Attacks - https://www.barracuda.com/products/webapplicationfirewall"

# Matches #
matches [

# Default stylesheet and error message
{ :text=>'<div style="border: 3px solid #4991C5; font:1.5em; font-family:tahoma,calibri,arial; font-weight:bold; color:#0A4369; padding:5px; margin:10px; text-align:center"> The requested service is temporarily unavailable. It is either overloaded or under maintenance. Please try later.</div><!--01234567890123456789' },

]

end

