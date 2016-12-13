##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Winstone" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-23
version "0.1"
description "Winstone is a servlet container that was written out of a desire to provide servlet functionality without the bloat that full J2EE compliance introduces."
website "http://winstone.sourceforge.net/"

# ShodanHQ results as at 2012-02-23 #
# 293 for Winstone Servlet Engine



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Winstone Servlet Engine v([^\s]+)/ },

# Version Detection # X-Powered-By Header
{ :search=>"headers[x-powered-by]", :version=>/Servlet\/[^\s]+ \(Winstone\/([^\)]+)\)/ },

]

end

