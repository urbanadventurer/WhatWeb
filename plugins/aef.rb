##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AEF" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-27
version "0.1"
description "Advanced Electron Forum (AEF) - bulletin board software - requires PHP and MySQL"
website "http://www.anelectron.com/"

# Google results as at 2011-09-27 #
# 385 for "Powered By AEF" "Electron Inc."

# ShodanHQ results as at 2011-09-27 #
# 6 for AEFCookies

# Dorks #
dorks [
'"Powered By AEF" "Electron Inc."'
]



# Matches #
matches [

# Meta Keywords
{ :certainty=>75, :text=>'<meta name="keywords" content="aef, advanced, electron, forum, bulletin, board, software" />' },

# Version Detection
{ :version=>/<a href="http:\/\/www\.anelectron\.com">Powered By AEF ([^<]{1,256})<\/a> &copy; [\d]{4}/ },

# AEFCookies cookie
{ :search=>"headers[set-cookie]", :regexp=>/AEFCookies[\d]*\[aefsid\]=/ },

]

end

