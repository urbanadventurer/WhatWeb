##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SLAED-CMS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-09-12
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
]
version "0.2"
description ""
website "http://slaed.net/"

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

