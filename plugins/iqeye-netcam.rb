##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "IQeye-Netcam"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-07-11
  # v0.2 # Updated version detection. 
  # v0.3 # Updated model detection. 
]
version "0.3"
description "IQeye netcam web interface"

# Google rsults as at 2010-07-11 #
# 5 for intitle:"IQeye302 | IQeye303 | IQeye601 | IQeye602 | IQeye603" intitle:"Live Images"



# Matches #
matches [

# Model detection # Default title
{ :model=>/<title>IQeye([^:]+): Live Images[^<]*<\/title>/i },

]

end

