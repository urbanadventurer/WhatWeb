##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-HTTP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Oracle HTTP Server"
website "http://www.oracle.com/technetwork/middleware/ias/index-091236.html"
# More Info: http://en.wikipedia.org/wiki/Oracle_HTTP_Server

# ShodanHQ results as at 2011-11-22 #
# 26,456 for Oracle HTTP Server
#  5,663 for Oracle HTTP Server Powered by Apache
#     97 for Oracle_Web_Listener



# Matches #
matches [

# HTTP Header # Server
{ :search=>"headers[server]", :regexp=>/Oracle[ -]HTTP[ -]Server/ },

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/Oracle_Web_[Ll]istener(_NT_)?([\d\.]+\/[^\s]+)/, :offset=>1 },
{ :search=>"headers[server]", :version=>/Oracle_Web_[Ll]istener(_NT_)?\/([^\s]+)/, :offset=>1 },

]

end

