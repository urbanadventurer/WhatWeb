##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Lussumo-Vanilla" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-07
version "0.2"
description "A free, open-source, standards-compliant discussion forum for the web. "
website "http://code.google.com/p/lussumo-vanilla/"

# ShodanHQ results as at 2011-03-13 #
# 74 for Lussumo Vanilla

# Google results as at 2011-05-07 #
# 20 for inurl:"people.php?PageAction=SignOutNow"

# Dorks #
dorks [
'inurl:"people.php?PageAction=SignOutNow"'
]

matches [
	
	# HTTP x-powered-by
	{ :version=>/Lussumo Vanilla/, :search=>"headers[x-powered-by]" },

	# Version Detection # HTTP x-powered-by
	{ :version=>/Lussumo Vanilla ([^\s]+)/, :search=>"headers[x-powered-by]" },

]

end

