##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 0.3 # 2011-03-21 # Brendan Coles <bcoles@gmail.com>
# Updated regex
##
# Version 0.2 # 2011-03-06 # Andrew Horton
# fixed examples= bug
##
Plugin.define "OpenCms" do
author "Emilio Casbas" #mostly
version "0.4"
description "OpenCms, professional and easy to use CMS."
website "http://www.opencms.org/"

# ShodanHQ results as at 2011-03-21 #
# 528 for opencms



# Matches #
matches [

	# Meta Generator
	{ :regexp=>/<meta name="generator"[^>]+content="OpenCms"( \/)?>/ },

	# Version Detection # Meta Generator
	{ :version=>/<meta name="generator"[^>]+content="Opencms version ([\d\.]+)"( \/)?>/ },

	# Relative link or img tag # /(opencms|export)/(sites|system)/
	{ :certainty=>75, :regexp=>/<(link|img)[^>]+(href|src)="[^"^:]*\/(opencms|export)\/(sites|system)\/[^"]+"[^>]*>/ },

	# Relative link or img tag # /opencms/
	{ :certainty=>25, :regexp=>/<(link|img)[^>]+(href|src)="[^"^:]*\/opencms\/[^"]+"[^>]*>/ },

	# HTTP Server Header
	{ :regexp=>/^OpenCms/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^OpenCms\/([a-z\d\.]+)/, :search=>"headers[server]" },

]

end



