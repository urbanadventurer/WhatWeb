##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "boastMachine"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-16
  # v0.2 # Updated matches, removed certainty and updated version detection. 
]
version "0.2"
description "boastMachine blog"
website "http://boastology.com/"

# 217 results for "powered by boastMachine" +"Recent posts" -exploit @ 2010-06-16

# Dorks #
dorks [
'"powered by boastMachine" "Recent posts" -exploit'
]



matches [

# Powered by text
{ :ghdb=>'"powered by boastMachine" +"Recent posts"', :certainty=>75 },

# Version detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/boastology.com">boastMachine v([\d\.]+)<\/a>/ },

# Default logo HTML
{ :regexp=>/<a href="http:\/\/boastology.com"><img src="http:\/\/[^>]*alt="Powered by boastMachine" \/><\/a>/ },

]

end


