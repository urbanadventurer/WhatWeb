##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zeus-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-25
version "0.1"
description "Zeus Web Server is the most scalable, high-performance web server software available, underpinning business-critical solutions for the world's leading web hosting, content provider and secure e-commerce companies."
website "http://www.zeus.com/products/web-server/"

# ShodanHQ results as at 2011-03-25 #
# 7,251 for zeus
#    38 for X-Zeus-Mapping



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Zeus$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^Zeus\/(([\d]+)(\.|_)([\d]+))$/ },

]

end

