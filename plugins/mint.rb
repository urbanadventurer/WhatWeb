##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mint" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-15
version "0.1"
description "Mint is an extensible, self-hosted web site analytics program"
website "http://www.haveamint.com/"



# Matches #
matches [

# JavaScript Source
{ :regexp=>/<script [^>]*src=["'][^>]*mint\/\?js/i },

]

end


