##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Data-ONTAP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-05
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

