##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Deluge-web" do
author "Andrew Horton" # 2015-05-06
version "0.1"
description "Deluge-web is a web interface to deluge, an open source, cross-platform BitTorrent client. Homepage - http://deluge-torrent.org/"

# Default port is 8112

# Dorks #
dorks [
'inurl:8112 intitle:deluge'
]

# Matches #
matches [
# Version in title
{ :version=>/<title>Deluge: Web UI ([^<]+)<\/title>/},
]

end
