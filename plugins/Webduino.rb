##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Webduino" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "Simple and extensible web server library for the Arduino using the Wiznet-based Ethernet shields."
website "https://code.google.com/p/webduino/"

# ShodanHQ results as at 2011-08-25 #
# 19 for Webduino



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Webduino$/ },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Webduino\/([^\s]+)/ },

]

end

