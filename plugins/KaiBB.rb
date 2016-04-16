##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "KaiBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "KaiBB Free and Open Bulletin Board Software - Requires: PHP and MySQL"
website "http://www.kaibb.co.uk/"

# Google results as at 2011-08-05 #
# 24 for "Powered by KaiBB"

# Dorks #
dorks [
'"Powered by KaiBB"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- THIS MUST REMAIN INTACT AND SHOWN ON ALL PAGES -->' },

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/www\.kaibb\.co\.uk" class="normfont">KaiBB ([^\s^<]+)<\/a>/ },

# Version Detection # Powered by link # Old versions # Seen on version 1.0.0
{ :version=>/Powered by <a href="http:\/\/\www\.mi-dia\.co\.uk" class="normfont">KaiBB ([^\s^<]+)<\/a>/ },

# Meta Description
{ :text=>'<meta name="Description" http-equiv="Description" content="Forum powered by KaiBB - Powered by KaiBB" />' },

]

end

