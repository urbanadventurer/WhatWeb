##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Typekit" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "JavaScript font manager"
website "http://typekit.com/"



# Matches #
matches [

# JavaScript Source
{ :regexp=>/<script [^>]*src=["'][^>]*use\.typekit\.com/i },

]

end


