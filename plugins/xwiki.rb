##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "XWiki"
authors [
  "Brendan Coles <bcoles@gmail.com>", # v0.1 # 2011-11-08
  "Andrew Horton", # v0.2 # 2019-07-10 # Fix warning: character class has duplicated range
]
version "0.2"
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
{ :version=>/<div id="xwikiplatformversion">(Powered by )?(XWiki Enterprise )?([^\s<>]+)/, :offset=>2 },

]

end

