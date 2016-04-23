##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sun-Java-System-Calendar-Express" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Sun Java System Calendar Server is Sun's calendar (scheduling) server."
website "http://www.sun.com/software/products/calendar_srvr/"

# Default Port # 6785

# Google results as at 2012-08-26 #
# 20 for intitle:"Sun Java[tm] System Calendar Express"
#  8 for intitle:"Sun Java System Calendar Server Online Help"

# Dorks #
dorks [
'intitle:"Sun Java[tm] System Calendar Express"'
]



# Matches #
matches [

# Title # Version Detection
{ :version=>/<title>Sun Java\[tm\] System Calendar Express ([^<]+)<\/title>/ },

# Frameset # Title
{ :text=>'<TITLE>Sun Java[tm] System Calendar Express</TITLE>' },

# Logo HTML
{ :text=>'<img src="imx/login-logo.gif" width="186" height="79" alt="Sun Microsystems, Inc.">' },

# /imx/login-logo.gif
{ :url=>"/imx/login-logo.gif", :md5=>"b86a7d65b64efa500048d9fc2840c390" },

]

end

