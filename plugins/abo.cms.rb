##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##

Plugin.define "ABO_CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.2"
description "ABO.CMS"
website "http://www.abocms.com/"

# ShodanHQ results as at 2011-04-08 #
# 54 for A-Powered-By

matches [
	
	# Version Detection # A-Powered-By Header
	{ :version=>/^ABO\.CMS( E-commerce| Corporative)? ([\d\.]+)/, :offset=>1 , :search=>"headers[a-powered-by]" },

]

end


