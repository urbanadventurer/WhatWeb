##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Datum-TymServe"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-09
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
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


