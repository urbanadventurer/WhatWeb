##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "thttpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "thttpd - tiny/turbo/throttling HTTP server - thttpd is a simple, small, portable, fast, and secure HTTP server. - Homepage: http://acme.com/software/thttpd/"

# ShodanHQ results as at 2011-05-31 #
# 103,691 for thttpd
#   6,657 for thttpd -2

# Examples #
examples %w|
201.88.14.154
189.56.131.246
200.181.129.194
200.135.64.94
189.30.9.105
220.133.178.8
189.31.148.62
202.214.246.201
58.70.107.139
173.20.81.207
74.51.10.234
82.229.195.70
|

# Matches #
matches [

# HTTP Server Header
#{ :search=>"headers[server]", :regexp=>/^thttpd$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^thttpd\/([^\s]+)/ },

]

end

