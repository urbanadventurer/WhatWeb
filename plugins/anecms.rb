##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ANECMS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-15
  # v0.2 # Updated regex. 
]
version "0.2"
description "ANECMS"
website "http://anecms.com/"

# Dorks #
dorks [
'"powered by anecms"'
]

# 11 results for "powered by anecms" @ 2010-06-15


matches [

# Default meta author
{ :text=>'<meta name="Author" content="Erwin Aligam - ealigam@gmail.com" />' },

# Powered by text
{ :ghdb=>'"powered by anecms"', :certainty=>75 },
{ :regexp=>/&copy; [\d]{4} <strong><a href="http:\/\/anecms.com[^\>]*>anecms.com<\/a><\/strong>/ },

# Default title
{ :regexp=>/<title>[^<^\-]+- Powered By ANECMS<\/title>/ },

]

end

