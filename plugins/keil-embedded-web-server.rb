##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Keil-Embedded-WEB-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.2"
description "Keil Embedded WEB Server"
website "http://www.keil.com/"
# More info: http://www.keil.com/support/man/docs/rlarm/rlarm_tn_cfghttp.htm

# ShodanHQ results as at 2011-05-31 #
# 220 for Keil-EWEB


# Matches #
matches [

# 401
{ :text=>'<head><title>Keil Embedded WEB Server</title></head><body><h2>HTTP 1.0 401 Error. Unauthorized Access</h2>You are not authorized to access this server.<hr>' },

# Version Detection # HTTP Server Header
{ :version=>/^Keil-EWEB\/([^\s]+)$/, :search=>"headers[server]" },
{ :regexp=>/^Keil-EWEB/, :search=>"headers[server]" },

]


end

