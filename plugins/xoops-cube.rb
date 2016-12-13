##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "XOOPS-Cube" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-11
version "0.1"
description "XOOPS Cube is an Open Source Web Application Platform"
website "http://xoopscube.org/"

# Google results as at 2011-12-11 #
# 363 for "Powered by XOOPS Cube"
#  98 for "Powered by XOOPS Cube" intitle:"XOOPS Cube Site :: Just Use it!"

# Dorks #
dorks [
'"Powered by XOOPS Cube"'
]



# Matches #
matches [

# Title
{ :certainty=>75, :text=>'<title>XOOPS Cube Site - Just Use it!</title>' },

# HTML Comment
{ :certainty=>75, :text=>'<!-- RMV: added module header -->' },

# Meta Generator
{ :text=>'<meta name="generator" content="XOOPS Cube" />' },

# Meta Author
{ :text=>'<meta name="author" content="XOOPS Cube" />' },

# Powered by text # Version Detection
{ :version=>/Powered by XOOPS Cube ([^\s^&]+)&copy; 200[01]-20[\d]{2} (<a href="http:\/\/xoopscube\.sourceforge\.net\/" target="_blank">)?XOOPS Cube Project/ },
{ :version=>/Powered by <a href="http:\/\/xoopscube\.org\/" rel="external">XOOPS Cube<\/a> ([^\s]+) &copy; 200[01]-20[\d]{2} <a href="http:\/\/xoopscube\.sourceforge\.net\/" rel="external">XOOPS Cube Project<\/a><\/p>/ },

]

end

