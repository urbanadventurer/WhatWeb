##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Citrix-NetScaler"
authors [
  "Aung Khant <http://yehg.net/>", # 2011-02-04
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
  "Bhavin Senjaliya", # v0.3 # 2017-11-27 # Add NSC_ cookie. 
]
version "0.3"
description "Citrix NetScaler  - http://www.citrix.com/netscaler"

matches [

	{ :regexp=>/NS\-CACHE/, :search=>"headers[via]" },

	{ :version=>/NS\-CACHE\-(\d{1,4}\.\d{1,4}):/, :search=>"headers[via]" },	

	{ :search => "headers[set-cookie]", :regexp => /^NSC_/, :name=>"NSC_ cookie" },

]

end


