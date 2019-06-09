##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Data-ONTAP"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-05
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Data ONTAP - fully virtualized data management environment. Data ONTAP provides a virtualized data environment with a simple interface that enables you to create virtual storage volumes, make changes quickly, and achieve superior storage utilization."
website "http://www.netapp.com/us/products/platform-os/data-ontap/"

# ShodanHQ results as at 2011-06-05 #
# 110 for Data ONTAP

matches [
	# Version Detection # HTTP Server Header
	{ :search=>"headers[server]", :version=>/^Data ONTAP\/\/?([^\s]+)$/ },

]

end

