##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Added website parameter and description
##
Plugin.define "Kleeja" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.2"
description "Kleeja is a free, open-source file upload system"
website "http://www.kleeja.com/"

# 55 results for intitle:"(powered by kleeja)" @ 2010-09-18
# 311 results for "powered by kleeja" @ 2010-09-18

# Dorks #
dorks [
'"powered by kleeja"'
]

matches [

# Default title
{ :regexp=>/<title>[^\(]+\(Powered by Kleeja\)<\/title>/ },

# Meta copyright
{ :text=>'<meta name="copyrights" content="Powered by Kleeja :: kleeja.com" />' },

# Meta description
{ :text=>'<meta name="Description" content="Powered by Kleeja :: kleeja.com" />' },

# Powered by text
{ :text=>'Powered by <a href="http://www.kleeja.com/" target="_blank">Kleeja</a>' },

# HTML comment
{ :text=>'<!-- IF REMOVE: Pay for a license -->' },
{ :text=>'<!-- IF REMOVE: Pay for a license - see http://www.kleeja.com -->' },

]

end

