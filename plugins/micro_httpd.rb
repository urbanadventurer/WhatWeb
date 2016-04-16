##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-12 #
# Updated regex match
##
Plugin.define "micro_httpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "micro_httpd is a very small Unix-based HTTP server. It runs from inetd, which means its performance is poor. But for low-traffic sites, it's quite adequate. It implements all the basic features of an HTTP server."
website "http://www.acme.com/software/micro_httpd/"

# ShodanHQ results as at 2010-10-26 #
# 957,229 for "server: micro_httpd"



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/micro_httpd/i },

]

end

