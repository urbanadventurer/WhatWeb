##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Xeneo-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "Xeneo Web Server"
website "http://www.northernsolutions.com/products/xeneo/"

# ShodanHQ results as at 2011-08-20 #
# 3 for Xeneo



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Xeneo\/([^\s]+)$/ },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Xeneo$/ },

]

end

