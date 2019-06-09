##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Web-Calendar-System"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-15
  # v0.2 # 2011-02-25 # Updated version detection. 
]
version "0.2"
description "web calendar system"

# Google results as at 2010-06-15 #
# 18,000,000 for +intitle:"Web Calendar system v" inurl:.asp



# Matches #
matches [

# GHDB Match
{ :certainty=>25, :ghdb=>'+intitle:"Web Calendar system v" inurl:.asp' },

# Version Detection # Default Title
{ :version=>/<TITLE>Web Calendar system v ([\.\d]+)<\/TITLE>/ },

]

end

