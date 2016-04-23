##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Enigma2" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-10
version "0.1"
description "Enigma2 is a framebuffer-based zapping application (GUI) for linux."
website "http://dream.reichholf.net/wiki/Enigma2"

# Google results as at 2011-01-10 #
# 159 for intitle:"Enigma2 movielist" filetype:rss

# Dorks #
dorks [
'intitle:"Enigma2 movielist" filetype:rss'
]



# Matches #
matches [

# RSS Feed # ./web/movielist.rss
{ :regexp=>/<\?xml version="1\.0" encoding="UTF-8"\?>[\s]+<rss version="2\.0">[\s]+<channel>[\s]+<title>Enigma2 Movielist<\/title>/ },

# ./web/ # 404
{ :text=>'<html><head><title>Enigma2 WebControl</title></head><body><h1>404 - Page not found</h1></body></html>' },

# Favicon # /web-data/img/favicon.ico
{ :url=>"/web-data/img/favicon.ico", :md5=>"d9aa63661d742d5f7c7300d02ac18d69" },

# RSS Link
{ :text=>'<link rel="alternate" type="application/rss+xml" title="Movie List" href="/web/movielist.rss?tag" >' },

]

end

