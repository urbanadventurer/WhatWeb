##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "W3MFC" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "W3Mfc is a collection of MFC classes to implement a Web Server"
website "http://www.naughter.com/w3mfc.html"

# ShodanHQ results as at 2010-11-01 #
# 5,486 for "Server: W3MFC"



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^W3MFC\/([\d\.]+)$/  },

]

end

