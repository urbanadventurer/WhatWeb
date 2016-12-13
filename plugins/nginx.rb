##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "nginx" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Nginx (Engine-X) is a free, open-source, high-performance HTTP server and reverse proxy, as well as an IMAP/POP3 proxy server."
website "http://nginx.net/"

# ShodanHQ results as at 2011-03-13 #
# 289,545 for nginx



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^nginx$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^nginx\/([^\s]+).*$/ },

]

end

