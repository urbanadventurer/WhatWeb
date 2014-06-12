##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# ~ Brendan Coles bcoles@gmail.com
# Added JavaScript detection
# Added <embed> element detection
# Added flash file path retrieval
##
Plugin.define "Adobe-Flash" do
author "Caleb Anderson"
version "0.2"
description "This plugin identifies instances of embedded adobe flash files."

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

