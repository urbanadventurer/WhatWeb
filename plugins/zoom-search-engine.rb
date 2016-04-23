##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zoom-Search-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-04-11
version "0.1"
description "Zoom is a software package that creates a search engine for your website, intranet, CD, or DVD"
website "http://www.wrensoft.com/zoom/"

# Google results as at 2011-04-11 #
# 337 for inurl:zoom_per_page

# Dorks #
dorks [
'inurl:zoom_per_page'
]



# Matches #
matches [

# Search powered by
{ :text=>'<center><p><small>Search powered by <a href="http://www.wrensoft.com/zoom/" target="_blank"><b>Zoom Search Engine</b></a></small></p></center>' },

# Version Detection # HTML Comment
{ :version=>/<!--Zoom Search Engine Version ([\d\.]+ \([\d]+\) [A-Z]{3})-->/ },

# Version Detection # HTML Comment
{ :version=>/<!--Zoom Search Engine Version ([\d\.]+ \([\d]+\))-->/ },

]

end


