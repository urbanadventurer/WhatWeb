##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "BinarySec-Firewall"
authors [
  "Aung Khant <http://yehg.net/>", # 2011-02-04
  # v0.2 # 2011-04-02 # Updated regex. 
  "Andrew Horton", # v0.3 # 2016-04-18 # Replaced passive function with matches. 
]
version "0.3"
description "BinarySec Web Application Firewall - http://www.binarysec.com"

matches [
	{:name=>"X-BinarySEC-Via header", :text=>"", :search=>"headers[x-binarysec-via]"},
	{:name=>"X-BinarySEC-NoCache header", :text=>"", :search=>"headers[x-binarysec-nocache]"},
	{:name=>"X-BinarySEC-NoCache header", :version=>/BinarySEC\/(\d{1,3}\.\d{1,4}\.\d{1,4})/, :search=>"headers[server]"},
]

end


