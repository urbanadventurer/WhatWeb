##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "XOOPS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-11
version "0.1"
description "eXtensible Object Oriented Portal System (XOOPS) open source CMS and portal system"
website "http://www.xoops.org/"

# Google results as at 2011-12-11 #
# 493 for "Powered by XOOPS"

# Dorks #
dorks [
'"Powered by XOOPS"'
]



# Matches #
matches [

# HTML Comment
{ :certainty=>75, :text=>'<!-- RMV: added module header -->' },

# Meta Generator
{ :text=>'<meta name="generator" content="XOOPS" />' },

# Meta Author
{ :text=>'<meta name="author" content="XOOPS" />' },

# Powered by text
{ :regexp=>/Powered by XOOPS [^\s]+ 2001-20[\d]{2} <a href="http:\/\/(xoops\.sourceforge\.net|www\.xoops\.org\/)"/ },

# Powered by text # Version Detection
{ :version=>/Powered by XOOPS ([^\s]+) [^\s]+ 2001-20[\d]{2} <a href="http:\/\/(xoops\.sourceforge\.net|www\.xoops\.org\/)"/ },

]

end

