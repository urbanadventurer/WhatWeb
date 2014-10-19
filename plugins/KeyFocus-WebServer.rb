##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "KeyFocus-WebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "KeyFocus Web Server is a free HTTP Server that can host an unlimited number of web sites."
website "http://www.keyfocus.net/kfws/"

# ShodanHQ results as at 2011-04-08 #
# 753 for KFWebServer



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^KFWebServer$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^KFWebServer\/([\d\.]+)/ },

]

end

