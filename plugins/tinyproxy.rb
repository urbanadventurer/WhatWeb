##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tinyproxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-16
version "0.1"
description "Tinyproxy is a light-weight HTTP/HTTPS proxy daemon for POSIX operating systems."
website "https://banu.com/tinyproxy/"

# ShodanHQ results as at 2011-09-16 #
# 757 for Tinyproxy



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^tinyproxy\/([^\s]+)/ },

]

end

