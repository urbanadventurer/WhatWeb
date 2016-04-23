##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-02-22 #
# Added Google dorks
# Added cookie match
##
Plugin.define "webSPELL" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "webSPELL is a free Content Management System which was especially developed for the needs of esport related communities."
website "http://www.webspell.org/"

# ShodanHQ results as at 2012-02-22 #
# 326 for ws_session

# Google results as at 2011-03-14 #
# 92 for "this site is using the webspell script version" -dork

# Dorks #
dorks [
'"this site is using the webspell script version" -dork'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="webSPELL" />' },

# Version Detection # This site is using link
{ :version=>/This site is using the <a href="http:\/\/www.webspell.org" target="[^"]+">webSPELL (Free Content Management System|script) \(version: ([^\)]+)\)[\s]*<\/a>/, :offset=>1 },

# Version Detection # This site is using link # German
{ :version=>/Diese Seite benutzt das <a href="http:\/\/www.webspell.org" target="[^"]+">webSPELL Script \(Version: ([^\)]+)\)[\s]*<\/a>/ },

# ws_session Cookie
{ :certainty=>75, :search=>"headers[set-cookie]", :regexp=>/ws_session=[a-z\d]+;/ },

]

end


