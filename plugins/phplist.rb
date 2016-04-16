##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phplist" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-04
version "0.1"
description "phplist is the world's most popular open source email campaign manager."
website "http://www.phplist.com/"

# 248 for "powered by phplist version" intitle:phplist

# Dorks #
dorks [
'"powered by phplist version" intitle:phplist'
]



# Matches #
matches [

# Misconfigured
{ :text=>'<html><head><title>Nothing here</title></head><body>' },
{ :text=>'<p>You probably want to be <a href="../">here</a> or <a href="admin/">here</a>.</p>' },

# Meta Author
{ :text=>'<meta name="Author" content="Michiel Dethmers - http://www.phplist.com" />' },

# Version Detection # Meta Powered By
{ :version=>/<meta name="Powered-By" content="phplist version ([^"]+)" \/>/ },

# Version Detection # Powered by link
{ :version=>/<span class="urhere">phplist powered by <\/span><a class="urhere" href="http:\/\/www\.phplist\.com" target="_blank">phplist<\/a> - version ([^<]+)<\/td>/ },

]

end


