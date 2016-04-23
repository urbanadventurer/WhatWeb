##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WikidForum" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-13
version "0.1"
description "WikidForum is an open source free forum software combined with a Wiki which allows users to convert forum discussions into valuable Wiki articles."
website "http://www.wikidforum.com/"

# Google results as at 2012-03-13 #
# 1 for intitle:"WikidForum Community Edition" intitle:"Installer"
# 1 for "powered by WikidForum"

# Dorks #
dorks [
'intitle:"WikidForum Community Edition" intitle:"Installer"',
'"powered by WikidForum"'
]



# Matches #
matches [

# Powered by link
{ :text=>'Powered by <a href="http://www.wikidforum.com" title="wikidforum.com">WikidForum</a>' },

]

end

