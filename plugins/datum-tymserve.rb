##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Datum-TymServe" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-09
version "0.2"
description "GPS NTP Network Appliances make it easy to manage and monitor time synchronization through workstations, servers and routers, thus assuring the highest integrity throughout the network."
website "http://www.datum.com/"

# ShodanHQ results as at 2011-03-09 #
# 20 for DATM

# Matches #
matches [

# Model Detection
{ :model=>/<H2 ALIGN=CENTER>Datum TymServe ([^\s]+) Virtual Viewpoint<\/H2><P><!-- This is a clock that shows the system time -->/ },

# HTTP Server header
{ :search=>"headers[server]", :version=>/^DATM\/([\d\.]{1,3})$/ },

]


end


