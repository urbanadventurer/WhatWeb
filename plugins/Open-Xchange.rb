##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Open-Xchange" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-14
version "0.1"
description "Open-Xchange mail server"
website "http://www.open-xchange.com/"

# ShodanHQ results as at 2012-07-14 #
# 38 for Location ox6/ox.html

# Google results as at 2012-07-14 #
# 41 for inurl:"ox6/ox.html"
# 32 for "You need to enable JavaScript to access the Open-Xchange Server." +Version inurl:ox

# Dorks #
dorks [
'inurl:"ox6/ox.html"',
'"You need to enable JavaScript to access the Open-Xchange Server." +Version inurl:ox'
]



# Matches #
matches [

# noscriptmsg
{ :text=>'<noscript><div class="noscriptmsg">You need to enable JavaScript to access the Open-Xchange Server.' },

# browserchecktextnormal
{ :text=>'<td class="browserchecktextnormal" id="browserchecktext_id">You need to enable JavaScript to access the Open-Xchange Server.' },

# Version Detection
{ :version=>/<div class="login-bottomline">\W+<span id="[a-z]\d+[a-z]\d+">Version<\/span>\s+:\W+([^\s]+\W+[^\W]+)/ },

# Location # ox6/ox.html # 6.x
{ :certainty=>75, :search=>"headers[location]", :regexp=>/^https?:\/\/[^\/]+\/ox6\/ox\.html$/, :version=>"6.x" },

]

end

