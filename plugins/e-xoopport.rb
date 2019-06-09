##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "E-Xoopport"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-09-18
  # v0.2 # 2011-02-16 # Updated version detection. 
]
version "0.2"
description "CMS"
website "http://www.e-xoopport.it/modules/news/"

# Google results as at 2010-09-18 #
# 159 for "powered by E-Xoopport"

# Dorks #
dorks [
'"powered by E-Xoopport"'
]



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/<div align='center'>Powered by E-Xoopport ([^&]+)&copy; 2004[\-0-9]{0,5} <a href='http:\/\/www.e-xoopport.it\/' target='_blank'>The E-Xoopport Project<\/a><\/div>/ },

# Version Detection # Meta generator
{ :version=>/<meta name="generator" content="E-Xoopport ([^"]+)">/ },

]

end

