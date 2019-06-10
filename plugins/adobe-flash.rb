##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Adobe-Flash"
authors [
  "Caleb Anderson",
  "Brendan Coles <bcoles@gmail.com>", # v0.2 # Added JavaScript detection. Added <embed> element detection. Added flash file path retrieval. 
  "Andrew Horton", # v0.3 # 2019-07-10 # Added website field.
]
version "0.3"
description "This plugin identifies instances of embedded adobe flash files."
website "https://get.adobe.com/flashplayer/"

# Google results as at 2010-10-14 #
# 244 for "your browser does not support flash"

# Dorks #
dorks [
'filetype:swf'
]


# Matches #
matches [

# Object tag
{ :regexp=>/<object[^>]+application\/x-shockwave-flash[^>]+>/i },

# flash file path from <embed> elements
{ :regexp=>/<embed[^>]+src[\s]*=[\s]*["']?[^\s^'^"^>]+/i },

# flash file path from Javascript
{ :regexp=>/new[\s]+FlashObject[\s]*\([\s]*['"]?[^'^"]+/ },
{ :regexp=>/new[\s]+SWFObject[\s]*\([\s]*['"]?[^'^"]+/ },
{ :regexp=>/\.embedSWF[\s]*\([\s]*["']?[^'^"]+/ },

]

end

