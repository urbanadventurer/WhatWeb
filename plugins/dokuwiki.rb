##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DokuWiki" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-20
version "0.1"
description "DokuWiki is a standards compliant, simple to use Wiki, mainly aimed at creating documentation of any kind."
website "http://dokuwiki.org/"

# Google results as at 2011-03-20 #
# 176 for "powered by DokuWiki" inurl:doku.php filetype:php

# Dorks #
dorks [
'"powered by DokuWiki" inurl:doku.php filetype:php'
]



# Matches #
matches [

# GHDB
{ :ghdb=>'"powered by DokuWiki" inurl:doku.php filetype:php' },

# div class
{ :regexp=>/<div class="dokuwiki"[\s]?>/ },

# Meta Generator
{ :text=>'<meta name="generator" content="DokuWiki" />' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="DokuWiki Release ([^"]+)" \/>/ },

]

end


