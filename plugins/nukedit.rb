##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Nukedit"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-07-25
  # v0.2 # 2011-02-25 # Updated version detection. 
]
version "0.2"
description "Nukedit CMS"
website "http://www.nukedit.com/"

# Google results as at 2010-07-25 #
# 122 for "powered by Nukedit"

# Dorks #
dorks [
'"powered by Nukedit"'
]



# Matches #
matches [

{ :regexp=>/Powered by Nukedit - <a href="(http:\/\/www.|http:\/\/)nukedit.com" target=_blank title="[^"]*"><span class=footer><u>(Web Content Management|Open Source CMS)<\/u><\/a><br>/ },

# Powered by text
{ :text=>'<a href="http://www.nukedit.com" target=_blank title="Fast web portal, friendly with search engines">Powered by Nukedit</a>' },

# HTML Comment
{ :text=>'							You can move it anywhere you want. -->' },

# Powered by text
{ :text=>'<a href="http://www.nukedit.com" target=_blank title="Fast web portal, friendly with search engines"><span class="footer">Powered by Nukedit</span></a><span class="footer"> |' },

# Version Detection # Powered by text
{ :version=>/				Powered by <a href="http:\/\/www.nukedit.com" target="_blank" title="Fast web portal, friendly with search engines">Nukedit<\/a> ([\d\.]+) / },

# Version Detection # Powered by footer
{ :version=>/					<span class=footer><center>Powered by Nukedit ([\d\.]+)<\/a> -/ },

]

end

