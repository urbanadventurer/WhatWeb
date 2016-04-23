##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SLAED-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-12
version "0.1"
description "Homepage: http://slaed.net/"

# Google results as at 2011-09-12 #
# 268 for "Powered by SLAED CMS"

# Dorks #
dorks [
'"Powered by SLAED CMS"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="SLAED CMS ([^"^>]+)">/ },

# Year Detection # Powered by text
{ :string=>/<br \/>Powered by <a href="http:\/\/www\.slaed\.net" target="_blank" title="SLAED CMS">SLAED CMS<\/a> &copy; 2005-(20[\d]{2}) SLAED/ },

]

end

