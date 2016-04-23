##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Syncrify" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-29
version "0.1"
description "Syncrify is a fast incremental remote backup that backs up files using the HTTP protocol."
website "http://web.synametrics.com/Syncrify.htm"

# Google results as at 2012-01-29 #
# 37 for intitle:"Syncrify - Fast incremental backup" "powered by Syncrify"



# Matches #
matches [

# / # Redirect Page
{ :md5=>"b5a85ee65b5fda5f8180e1f9c2ab0560" },

# /images/468x60.gif
{ :url=>"/images/468x60.gif", :md5=>"2197210023deed6e71c704b6a27867a1" },

# /app?operation=about # Version Detection
{ :version=>/<h3>Syncrify - <small>Version: ([\d\.]+ - build [\d]+)<\/small><\/h3>/ },

# Title # Version Detection
{ :version=>/<title>[\s]+Syncrify - Fast incremental backup - Version: ([\d\.]+ - build [\d]+) [\s]+<\/title>/ },

# Meta Keywords
{ :text=>'<meta NAME="Keywords" CONTENT="Syncrify - Fast incremental backup" />' },

# Powered by link
{ :text=>"<p>Powered by <a href='http://www.syncrify.com' >Syncrify</a></p>" },

]

end

