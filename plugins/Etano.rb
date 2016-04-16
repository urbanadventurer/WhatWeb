##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Etano" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-24
version "0.1"
description "Etano - Dating and social networking script"
website "https://code.google.com/p/etano/"

# Google results as at 2012-03-24 #
# 42 for "Powered by Etano" intitle:"Etano"

# Dorks #
dorks [
'"Powered by Etano" intitle:"Etano"'
]



# Matches #
matches [

# Powered by link
{ :text=>'All Rights Reserved.<br />Powered by <a href="http://www.datemill.com" title="Etano community builder">Etano</a>.</p>' },

# All rights reserverd footer
{ :text=>'Etano</a>. All Rights Reserved.<br />' },

]

end

