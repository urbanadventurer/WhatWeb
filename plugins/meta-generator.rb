##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-01-26 #
# Updated regex
##
# Version 0.2
# remove :certainty
##
Plugin.define "MetaGenerator" do
author "Andrew Horton"
version "0.3"
description "This plugin identifies meta generator tags and extracts its value."



# Matches #
matches [

	# Extract value from the content param
	{ :string=>/<meta[^>^=]+content[\s]*=[\s]*["|']?([^"^'^>]+)["|']?[^>^=]+name[\s]*=[\s]*["|']?generator["|']?/i },
	{ :string=>/<meta[^>^=]+name[\s]*=[\s]*["|']?generator["|']?[^>^=]+content[\s]*=[\s]*"([^"^'^>]+)"/i },

]

end

