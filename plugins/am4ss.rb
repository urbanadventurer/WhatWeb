##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AM4SS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-11
version "0.1"
description "Advanced Management For Services Sites (AM4SS)"
website "http://am4ss.org/"

# ShodanHQ results as at 2011-09-11 #
# 396 for "Powered by AM4SS"
# 353 for intitle:"Powered by AM4SS"

# Dorks #
dorks [
'intitle:"Powered by AM4SS"'
]



# Matches #
matches [

# Version Detection # Meta Copyright
{ :version=>/<meta name="copyright" content="Powered by am4ss ([^\s]+) (Programmed By|programming by) Mohammed Cherkaoui" \/>/ },

# HTML Comment
{ :text=>'<!-- Header end and right block start -->' },

# Powered by text
{ :text=>'Powered By <a href="http://am4ss.com"><font color="#FF000">AM4SS</font></a>' },

# StyleSheet
{ :regexp=>/<link rel="stylesheet" type="text\/css" href="templates\/[^\/]+\/am4ss\.css" \/>/ },

]

end

