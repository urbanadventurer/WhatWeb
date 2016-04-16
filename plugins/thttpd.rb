##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "thttpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "thttpd - tiny/turbo/throttling HTTP server - thttpd is a simple, small, portable, fast, and secure HTTP server."
website "http://acme.com/software/thttpd/"

# ShodanHQ results as at 2011-05-31 #
# 103,691 for thttpd
#   6,657 for thttpd -2



# Matches #
matches [

# HTTP Server Header
#{ :search=>"headers[server]", :regexp=>/^thttpd$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^thttpd\/([^\s]+)/ },

]

end

