##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WordPress-Stats" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-12
version "0.1"
description "WordPress.com Stats"
website "https://wordpress.com"



# Matches #
matches [

# JavaScript
{ :regexp=>/<script src="https?:\/\/(ssl-)?stats\.wordpress\.com\/[^"]+" type="text\/javascript"><\/script>/ },

# NoScript
{ :regexp=>/<noscript><img src="https?:\/\/stats\.wordpress\.com\/b\.gif\?v=noscript"/ },

]

end

