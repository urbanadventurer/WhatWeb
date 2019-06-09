##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Frame-URLs"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-13
  # v0.2 # Fixed regex to return multiple frames. 
]
version "0.2"
description "This plugin detects instances of frame and iframe HTML elements and grabs the URL."

# Google results as at 2010-10-13 #
# 213 for "your browser does not support frames"



# Passive #
matches [

# Extract (i)frame source URL
{ :string=>/<[\s]*[i]?frame[^>]+src[\s]*=[\s]*["|']?([^>^"^'^\s]+)/i },

]

end

