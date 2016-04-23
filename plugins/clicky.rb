##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Clicky" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-07
version "0.1"
description "Clicky - Real Time Web Analytics"
website "https://www.getclicky.com/"



# Matches #
matches [

# JavaScript
{ :regexp=>/<script[^>]+src=["'](https?:)?\/\/static\.getclicky\.com/i },

]

end

