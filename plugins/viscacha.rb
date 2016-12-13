##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Viscacha" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-15
version "0.1"
description "Viscacha is a free bulletin board system with an integrated content management system."
website "http://www.viscacha.org/"

# 268 results for "powered by Viscacha"
# 86 for "powered by Viscacha" "The Viscacha Project" inurl:register.php

# Dorks #
dorks [
'"powered by Viscacha" "The Viscacha Project" inurl:register.php'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="Viscacha (http://www.viscacha.org)" />' },

# Meta Copyright
{ :text=>'<link rel="copyright" href="http://www.viscacha.org" />', :certainty=>75 },

# Version detection # Powered by footer
{ :version=>/Powered by <strong><a[^>]+href="http:\/\/www\.viscacha\.org" target="_blank">Viscacha ([^<]+)<\/a>/ },

]

end


