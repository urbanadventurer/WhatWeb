##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "SmugMug" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.2"
description "SmugMug is a paid digital photo sharing website"
website "http://www.smugmug.com/"

# ShodanHQ results as at 2011-03-16 #
# 246 for x-powered-by smugmug

matches [

	# X-Powered-By
	{ :regexp=>/^SmugMug/, :search=>"headers[x-powered-by]" },

	# Version Detection # X-Powered-By
	{ :version=>/^SmugMug\/([\d\.]+)$/, :search=>"headers[x-powered-by]" },

	# X-SmugMug-Values
	{ :name=>"X-SmugMug-Values HTTP Header", :regexp=>//, :search=>"headers[x-smugmug-values]" },

]

end


