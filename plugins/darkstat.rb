##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "darkstat" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-17
version "0.1"
description "darkstat captures network traffic, calculates statistics about usage, and serves reports over HTTP."
website "http://unix4lyfe.org/darkstat/"

# ShodanHQ results as at 2012-02-17 #
# 11 for darkstat

# Google results as at 2012-02-17 #
# 15 for intitle:darkstat intitle:"graphs" "graphs" "Running for"

# Dorks #
dorks [
'intitle:darkstat intitle:"graphs" "graphs" "Running for"'
]



# Matches #
matches [

# Menu # Version Detection
{ :version=>/<li class="label">darkstat ([^\s^<]+)<\/li><li><a href="[^"]+">graphs<\/a><\/li>/ },

# Title # Version Detection
{ :version=>/<title>darkstat ([^\s]+) : graphs ([^\s^\)]+)<\/title>/ },

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^darkstat\/([^\s]+)$/ },

]

end

