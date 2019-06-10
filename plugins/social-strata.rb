##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Social-Strata"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-21
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
]
version "0.2"
description ""
website "http://socialstrata.com/"

# Google results as at 2011-04-21 #
# 60 for inurl:"/eve/personal?x_myspace_page=profile"
#  3 for "Error u is invalid. Powered by: GroupeeTM"

# Dorks #
dorks [
'inurl:"/eve/personal?x_myspace_page=profile"'
]


# Matches #
matches [

# URL pattern
{ :ghdb=>'inurl:"/eve/personal?x_myspace_page=profile" "Powered by Social Strata"' },

# Powered by text
{ :text=>'<a href="http://socialstrata.com/landing/goto.php?a=eve" target="_blank">Powered by Social Strata</a>' },

# Version Detection # Powered by text
{ :version=>/Powered by: <a target="_blank" href="http:\/\/eveforenterprise\.com">Groupee<\/a><SUP>TM<\/SUP> \(version ([\d\.]+)\) from Groupee Inc\./ },

]

end


