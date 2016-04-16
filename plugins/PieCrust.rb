##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PieCrust" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-12
version "0.1"
description "PieCrust is a static website generator and lightweight CMS that's all managed with text files."
website "http://bolt80.com/piecrust/"

# Dorks #
dorks [
'"Baked with PieCrust"'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="PieCrust" />' },

# Meta Generator # Version Detection
{ :version=>/<meta name="generator" content="PieCrust ([^\s^"]+)" \/>/ },

# Footer # Version Detection
{ :version=>/Baked with <em><a href="http:\/\/bolt80\.com\/piecrust\/">PieCrust<\/a> ([^\s^<]+)<\/em>\.<\/p>/ },

]

end

