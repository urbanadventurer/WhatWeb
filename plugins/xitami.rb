##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Xitami" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Xitami - Fast, small, secure, portable web server. The Xitami product line stretches back to 1996. X5 is built using iMatix's current Base2 technology for multithreading applications."
website "http://www.xitami.com/"

# ShodanHQ results as at 2011-05-31 #
# 1,777 for Xitami



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Xitami$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^Xitami\/([^\s]+)$/ },

]

end

