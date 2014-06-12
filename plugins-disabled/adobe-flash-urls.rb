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
Plugin.define "Adobe-Flash-URLs" do
author "Caleb Anderson"
version "0.2"
description "This plugin identifies instances of embedded adobe flash files and attempts to retrieve the flash file path."

# Google results as at 2010-10-14 #
# 244 for "your browser does not support flash"



# Matches #
matches [

# Object tag
{ :regexp=>/<object[^>]+application\/x-shockwave-flash[^>]+>.*?<\/object>/im },

# Extract flash file path from <embed> elements
{ :string=>/<embed[^>]+src[\s]*=[\s]*'([^\s^'^>]+)/i },
{ :string=>/<embed[^>]+src[\s]*=[\s]*"([^\s^"^>]+)/i },

# Extract flash file path from Javascript
{ :string=>/new[\s]+FlashObject[\s]*\([\s]*'([^\']+)/ },
{ :string=>/new[\s]+FlashObject[\s]*\([\s]*"([^\"]+)/ },
{ :string=>/new[\s]+SWFObject[\s]*\([\s]*'([^\']+)/ },
{ :string=>/new[\s]+SWFObject[\s]*\([\s]*"([^\"]+)/ },
{ :string=>/.embedSWF[\s]*\([\s]*'([^\']+)/},
{ :string=>/.embedSWF[\s]*\([\s]*"([^\"]+)/ },

]

end

