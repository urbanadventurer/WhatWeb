##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "NetGear-Print-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.2"
description "NetGear Print Server - Print servers connect printers directly to the network so that multiple PCs can share them."
website "http://www.netgear.com.au/au/Products/Print-Servers"

# ShodanHQ results as at 2011-03-07 #
# 1,142 for PRINT_SERVER WEB
# 1,142 for PRINT_SERVER WEB 1.0



# Matches #
matches [

# Title
{ :text=>'<title>NetGear Print Server Setup</title>' },

# NoScript Message
{ :text=>'<p>To provide an enhanced user interface, this Print Server uses JavaScript extensively.' },

# Title # /start.htm
{ :url=>"/start.htm", :text=>"<title>NETGEAR Print Server </title>" },

# Logo # /settings.gif
{ :url=>"/settings.gif", :md5=>"d6b979c739a809658a0e8833bc64b900" },

{ :certainty=>25, :version=>/^PRINT_SERVER WEB ([\d\.]+)$/, :search=>"headers[server]" },

]


end


