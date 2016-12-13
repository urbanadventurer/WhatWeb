##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tengine-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-17
version "0.1"
description "Tengine is a web server originated by Taobao, the largest e-commerce website in Asia. It is based on the popular Nginx HTTP server."
website "http://tengine.taobao.org/"

# ShodanHQ results as at 2012-05-17 #
# 355 for Tengine



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Tengine$/ },

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^Tengine\/([^\s]+)/ },

]

end

