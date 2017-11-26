##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2017-11-27 # Bhavin Senjaliya
# Add NSC_ cookie
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##

Plugin.define do
name "Citrix-NetScaler"
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.3"
description "Citrix NetScaler  - http://www.citrix.com/netscaler"

matches [

	{ :regexp=>/NS\-CACHE/, :search=>"headers[via]" },

	{ :version=>/NS\-CACHE\-(\d{1,4}\.\d{1,4}):/, :search=>"headers[via]" },	

	{ :search => "headers[set-cookie]", :regexp => /^NSC_/, :name=>"NSC_ cookie" },

]

end


