##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Citrix-ConfProxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-11
version "0.2"
description "Citrix ConfProxy ISAPI"
website "http://www.citrix.com/"

# ShodanHQ results as at 2011-04-11 #
# 73 for confproxy

matches [
	{:version=>/^confproxy\/([\d\.]+)/, :search=>"headers[server]"},
]

end

