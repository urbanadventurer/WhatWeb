##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-17 # Brendan Coles <bcoles@gmail.com>
# Updated version detection
##
Plugin.define "CommonSpot" do
author "Tonmoy Saikia"
version "0.2"
description "The CommonSpot Web content management solution (Web CMS) increases the value of content by creating engaging Web experiences that generate high impact results."
website "http://www.paperthin.com/"



# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta[^>]+name="Generator"[^>]+content="CommonSpot[^"]+"[^>]*\/>/ },

# img tags
{ :regexp=>/<img[^>]+src="[^"]+commonspot[^"]+"[^>]*\/>/ },

# commonspot.css
{ :regexp=>/<link[^>]+href="[^"]commonspot\/commonspot\.css"[^>]+\/>/ },

# Version Detection # Meta Generator
{ :version=>/<meta[^>]+name="Generator"[^>]+content="CommonSpot[^\d^"]+([\d\.]+)"[^>]*\/>/ },

]

end

