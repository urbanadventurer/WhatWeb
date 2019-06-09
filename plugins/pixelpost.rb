##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "PixelPost"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-09-18
	"Andrew Horton", # v0.2 # 2019-07-10 # Fix false negatives and fix warning: character class has duplicated range
]
version "0.2"
description "Pixelpost is an open-source, standards-compliant, multi-lingual, fully extensible photoblog application for the web. Requirements: PHP 4.3 or greater (w/ GD-lib) and MySQL 3.23.58 or greater"
website "http://www.pixelpost.org/"

# 382 results for "powered by pixelpost" @ 2010-09-18
# Dorks #
dorks [
'"powered by pixelpost"'
]


matches [

# Powered by text
{ :regexp=>/[Pp]owered by <a href="http:\/\/www.pixelpost.org[\/]?"[\s]*(title="Powered by Pixelpost")?>[Pp]ixel[Pp]ost</ },
{ :text=>'Powered by <a onclick="window.open(this.href); return false;" href="http://pixelpost.org/" title="Pixelpost">Pixelpost</a>' },

]

end

