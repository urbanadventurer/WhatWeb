##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TinyBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "TinyBB is a free, simple bulletin board script."
website "http://tinybb.net/"

# Google results as at 2011-04-17 #
# 41 for "Proudly powered by TinyBB"

# Dorks #
dorks [
'"Proudly powered by TinyBB"'
]



# Matches #
matches [

# Powered by link
{ :text=>"Proudly powered by <a href='http://tinybb.net'>TinyBB</a>" },

]

end


