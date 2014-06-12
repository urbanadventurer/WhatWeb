##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Address" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-25
version "0.1"
description "This plugin identifies the 'address' (X)HTML/XML element and extracts its value."

# Google rsults as at 2011-01-25 #
# 124,000,000 for "Apache" "Server at" intitle:"index of"



# Matches #
matches [

	# Extract address value
	{ :string=>/<address>([^<]*)<\/address>/i },
	{ :string=>/<address value="([^"]+)"[^>]*>/i },

]

end


