##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Allomani-E-Store" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-02
version "0.1"
description "E-Store with shopping cart for online shopping websites , hosting & designing , Paid services , etc ... Requirements : PHP, MySQL, ionCube"
website "http://allomani.com/en/store_script.html"

# Google results as at 2011-02-08 #
# 71 for "Programmed By Allomani"

# Dorks #
dorks [
'"Programmed By Allomani"'
]



# Matches #
matches [

	# Version Detection # Meta Generator
	{ :version=>/<meta name="generator" content="Allomani Store v([\d\.]+)" \/>/ },

]

end


