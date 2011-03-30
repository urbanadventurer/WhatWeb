##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Namazu" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-30
version "0.1"
description "Namazu is a full-text search engine intended for easy use. Not only does it work as a small or medium scale Web search engine, but also as a personal search system for email or other files. - Homepage: http://www.namazu.org/"

# Google results as at 2011-03-30 #
# 259 for "powered by Namazu"

# Examples #
examples %w|
search.namazu.org
www.hioki.com/cgi-bin/eng/namazu.cgi
www.bobcatos.com/hdlist/archives/cgi-bin/namazu.cgi
www.biostat.wustl.edu/archives/cgi-bin/namazu.cgi.BAK
www.tamiya.com/cgi-bin/search/namazu.cgi
www.shitomi.jp
www.jazzdisco.org/cgi-bin/namazu.cgi
www.nmri.go.jp/cgi-bin/search-e/search.cgi
lists.xensource.com/archives/cgi-bin/namazu.cgi
cgi.mlab.uiah.fi/cgi-bin/mulli/namazu/english/namazu.cgi
www.xemacs.org/cgi-bin/namazu.cgi
www.toppan.co.jp/cgi-bin/en/namazu.cgi
search.senshu-u.ac.jp/cgi-bin/z.cgi
typhoon.jaea.go.jp/cgi-bin/namazu.cgi
www.realsoftware.com/listarchives/cgi-bin/namazu.cgi
dayton.contesting.com/archives//cgi-bin/namazu.cgi
jos.dent.nihon-u.ac.jp/namazu/namazu.cgi
doc.fugspbr.org/historico/cgi-bin/namazu.cgi
www.jseinc.org/namazu/namazu.cgi
|

# Matches #
matches [

# Powered by footer
{ :regexp=>/This search system is powered by[\s]+<strong><a href="http:\/\/www\.namazu\.org\/">Namazu<\/a><\/strong>/ },
{ :regexp=>/Powered by <a href="http:\/\/www\.namazu\.(org|cc)\/[^"]*" target="_blank">(N|n)amazu<\/a>/ },

# HTML Comment and strong tags
{ :regexp=>/<p><strong> Total <!-- HIT -->[\d]+<!-- HIT --> documents matching your query.<\/strong><\/p>/ },

# Version Detection # HTML Comment
{ :version=>/<strong><a href="http:\/\/www\.namazu\.org\/">Namazu<\/a> <!-- VERSION --> v([\d\.]+) <!-- VERSION --><\/strong>/i },
{ :version=>/This search system is powered by <a href="http:\/\/www\.namazu\.org\/">Namazu<\/a> <!-- VERSION --> v([\d\.]+) <!-- VERSION --><\/p>/i },

]

end


