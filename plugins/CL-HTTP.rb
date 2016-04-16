##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CL-HTTP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-15
version "0.1"
description "Common Lisp Hypermedia Server (CL-HTTP) - HTTP server"
website "http://www.cl-http.org:8001/cl-http/"

# ShodanHQ results as at 2011-08-15 #
# 25 for CL-HTTP



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^CL-HTTP\/([^\s]+)/ },
{ :search=>"headers[server]", :string=>/^CL-HTTP\/[^\s]+ \(([^\)]+)\)/ },

]

end

