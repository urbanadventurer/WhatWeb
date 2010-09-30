##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "MediaWiki" do
author "Tonmoy Saikia"
version "0.1"
description "MediaWiki is a free software wiki  package written in PHP, originally for use on Wikipedia http://www.mediawiki.org/wiki/MediaWiki"

examples %w|
http://meta.wikimedia.org/Main_Page
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
matches [
{:text=>'alt="Powered by MediaWiki"'},
{:ghdb=>'inurl:wiki MediaWiki'}
]

end

