##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "bbPress"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-06
  "@lins05", # v0.2 # 2014-06-19 # Add div match. 
]
version "0.2"
description "bbPress is forum software with a twist from the creators of WordPress."
website "http://bbpress.org/"

# Google results as at 2011-04-06 #
# 534 for "is proudly powered by bbPress"

# Dorks #
dorks [
'"is proudly powered by bbPress"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="bbPress ([\d\.]+)" \/>/ },

# Proudly powered by text
{ :regexp=>/ is proudly powered by <a[^>]+href="http:\/\/bbpress\.org">bbPress<\/a>/ },

# HTML Comment
{ :text=>'<!-- If you like showing off the fact that your server rocks -->' },

{ :text=>'<div id="bbpress-forums">' },

]

end


