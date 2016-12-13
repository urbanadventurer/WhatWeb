##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RaidenHTTPD" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-16
version "0.1"
description "RaidenHTTPD is a fully featured web server software for Windows platform."
website "http://www.raidenhttpd.com/en/"

# ShodanHQ results as at 2011-09-16 #
# 542 for RaidenHTTPD



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^RaidenHTTPD\/([^\s]+) \([^\)]+\)$/ },

# Edition Detection # HTTP Server Header
{ :search=>"headers[server]", :string=>/^RaidenHTTPD\/[^\s]+ \(([^\)]+)\)$/ },

]

end

