##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "MediaWiki"
authors [
  "Tonmoy Saikia",
  "Brendan Coles <bcoles@gmail.com>", # v0.2 # 2011-09-21 # Added google dorks and version detection. 
]
version "0.2"
description "MediaWiki is a free software wiki  package written in PHP, originally for use on Wikipedia http://www.mediawiki.org/wiki/MediaWiki"

# Google results as at 2011-09-21 #
# 802 for "Powered by MediaWiki"
# 393 for inurl:wiki/MediaWiki
#  47 for inurl:Special:Version "This wiki is powered by MediaWiki"

# Dorks #
dorks [
'"Powered by MediaWiki"',
'inurl:wiki/MediaWiki',
'inurl:Special:Version "This wiki is powered by MediaWiki"'
]



# Matches #
matches [

# Logo alt text
{ :text=>'alt="Powered by MediaWiki"' },

# GHDB # URL Pattern
{ :certainty=>75, :ghdb=>'inurl:wiki MediaWiki' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="MediaWiki ([^\s^"]+)" \/>/ },

# Version Detection # wiki/Special:Version
{ :version=>/<td><a href="http:\/\/www\.mediawiki\.org\/" class="external text" rel="nofollow">MediaWiki<\/a><\/td>[\s]+<td>([^<]+)<\/td>/ },

]

end

