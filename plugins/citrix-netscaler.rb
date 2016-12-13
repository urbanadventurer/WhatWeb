##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##

Plugin.define "Citrix-NetScaler" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.2"
description "Citrix NetScaler  - http://www.citrix.com/netscaler"

matches [

	{ :regexp=>/NS\-CACHE/, :search=>"headers[via]" },

	{ :version=>/NS\-CACHE\-(\d{1,4}\.\d{1,4}):/, :search=>"headers[via]" },	

]

end


