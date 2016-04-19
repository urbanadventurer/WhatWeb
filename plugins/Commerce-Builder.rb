##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Commerce-Builder" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.2"
description "Internet Factory's Commerce Builder web server [Discontinued]"
website "http://www.ifact.com/"

# ShodanHQ results as at 2011-06-01 #
# 32 for commerce-builder

matches [

	{:version=>/^Commerce-Builder\/([^\s]+)/, :search=>"headers[server]"},

]

end

