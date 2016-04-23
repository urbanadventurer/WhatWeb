##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "XWiki" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-08
version "0.1"
description "XWiki - Open Source Wiki and Content-Oriented Application Platform"
website "http://www.xwiki.org/"

# ShodanHQ results as at 2011-11-08 #
# 143 for location bin/view/Main

# Google results as at 2011-11-08 #
# 216 for "XWiki Enterprise * Documentation" inurl:"bin/view/Main"
# 173 for "XWiki Enterprise * Documentation" "This wiki is licensed under a Creative Commons 2.0 license"

# Dorks #
dorks [
'"XWiki Enterprise * Documentation" inurl:"bin/view/Main"'
]



# Matches #
matches [

# Meta Wiki
{ :text=>'<meta name="wiki" content="xwiki"/>' },

# div id="xwikilicence"
{ :text=>'<div id="xwikilicence">' },

# Version Detection # div id="xwikiplatformversion"
{ :version=>/<div id="xwikiplatformversion">(Powered by )?(XWiki Enterprise )?([^\s^<^>]+)/, :offset=>2 },

]

end

