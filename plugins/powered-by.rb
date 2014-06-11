##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-02-15 # Brendan Coles < bcoles at gmail dot com >
# Updated regex match
##
# Version 0.2
# removed :certainty
##
Plugin.define "PoweredBy" do
author "Andrew Horton"
version "0.3"
description "This plugin identifies instances of 'Powered by x' text and attempts to extract the value for x."

# Google results as at 2011-02-15 #
# 11,360,000,000 for allintext:"powered by"



# Matches could be improved by:
#   Stripping HTML and CSS tags
#   Handling whitespace more effectively

# Matches #
matches [

	# Powered by text
	{ :string=>/powered[ -]?by[ ]?([^\s<>'".]+)/i },

]

end

