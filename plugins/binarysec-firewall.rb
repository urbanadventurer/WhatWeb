##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-18 #
# Replaced passive function with matches
##
# Version 0.2 # 2011-04-02 #
# Updated regex
##
Plugin.define "BinarySec-Firewall" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.3"
description "BinarySec Web Application Firewall - http://www.binarysec.com"

matches [
	{:name=>"X-BinarySEC-Via header", :text=>"", :search=>"headers[x-binarysec-via]"},
	{:name=>"X-BinarySEC-NoCache header", :text=>"", :search=>"headers[x-binarysec-nocache]"},
	{:name=>"X-BinarySEC-NoCache header", :version=>/BinarySEC\/(\d{1,3}\.\d{1,4}\.\d{1,4})/, :search=>"headers[server]"},
]

end


