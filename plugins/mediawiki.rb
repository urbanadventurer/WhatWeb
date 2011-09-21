##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-09-21 # Brendan Coles <bcoles@gmail.com>
# Added google dorks and version detection
##
Plugin.define "MediaWiki" do
author "Tonmoy Saikia"
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

# Examples #
examples %w|
http://en.wikipedia.org/wiki/Main_Page
http://en.wiktionary.org/wiki/Main_Page
http://en.wikibooks.org/wiki/Main_Page
http://en.wikisource.org/wiki/Main_Page
http://en.wikiquote.org/wiki/Main_Page
http://commons.wikimedia.org/wiki/Main_Page
http://en.wikinews.org/wiki/Main_Page
http://species.wikimedia.org/wiki/Main_Page
http://wiki.case.edu/wiki/Main_Page
http://www.cgnotebook.com/wiki/Main_Page
http://en.cinoku.com/wiki/Main_Page
http://desciclopedia.org/wiki/Main_Page
http://celestia.pl/Wiki/Main_Page
http://www.boincatpoland.org/wiki/Main_Page
|

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

