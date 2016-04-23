##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-WebDB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Oracle WebDB is a complete solution for building, deploying, and proactively monitoring Web database applications and content-driven Web sites."
website "http://download.oracle.com/docs/cd/A81042_01/DOC/webdb.816/index.htm"
# More Info: http://docs.oracle.com/cd/A81042_01/DOC/webdb.816/a77075.pdf

# ShodanHQ results as at 2011-11-22 #
# 103 for WebDB
#  76 for WebDB/WEBDB.home



# Matches #
matches [

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/^Oracle_WebDb_Listener\/([^\s]+)/ },

# HTTP Header # Location # /WebDB/WEBDB.home
{ :search=>"headers[location]", :regexp=>/^(https?:\/\/[^\/]+)?\/WebDB\/WEBDB\.home$/, :certainty=>75 },

]

end

