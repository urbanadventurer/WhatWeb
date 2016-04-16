##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "podPress" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "podPress - A dream plugin for Podcastrs using WordPress."
website "http://www.mightyseek.com/podpress"

# Google results as at 2011-03-17 #
# 523 for "Podcast powered by podPress"

# Dorks #
dorks [
'"Podcast powered by podPress"'
]



# Matches #
matches [

# Version Detection # cite powered by
{ :version=>/<cite>Podcast Powered by <a href="http:\/\/www.mightyseek.com\/podpress\/" title="podPress, the dream plugin for podcasting with WordPress"><strong>podPress \(v([\d\.]+)\)<\/strong><\/a><\/cite>/ },

# Version Detection # podPress_footer
{ :version=>/<div id="podPress_footer">Podcast powered by <a href="http:\/\/wordpress.org\/extend\/plugins\/podpress\/" title="podPress, a plugin for podcasting with WordPress"><strong>podPress v([\d\.]+)<\/strong><\/a><\/div>/ },

]

end


