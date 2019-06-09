##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Pixie"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-07-18
  # v0.2 # 2011-02-25 # Updated version detection. 
]
version "0.2"
description "pixie is a free, open source web application that will help you quickly create your own website"
website "http://www.getpixie.co.uk/"

# Google results as at 2010-07-18 #
# 5 for +"powered by pixie" -"Powered by Pixie Dust" +theme



# Matches #
matches [

# Powered by text
{ :regexp=>/href="http:\/\/www.getpixie.co.uk" title="Get Pixie">(Pixie Powered|Powered by Pixie|Pixie)<\/a>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Pixie ([\d\.]+) - Copyright \(C\) [\d]{4} - [\d]{4}\." \/>/ },

]

end

