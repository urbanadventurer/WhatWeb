##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Script-URLs"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-14
  # v0.2 # Fixed regex to return multiple scripts. 
]
version "0.2"
description "This plugin detects instances of script HTML elements and retrieves the URL."

# Google results as at 2010-10-14 #
# 384 for "your browser does not support javascript"



# Matches #
matches [

# Extract source URL
{ :string=>/<script[^>]+src\s*=\s*["']?([^>^"^']+)/i },

]

end

