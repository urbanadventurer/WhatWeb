##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "UCenter-Home"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-12
  "Andrew Horton", # v0.2 # 2016-04-17 # Added website parameter and description. 
]
version "0.2"
description "Social networking platform developed by Comsenz. Uses PHP and MySQL. Wikipedia page: https://zh.wikipedia.org/wiki/UCenter_Home"
website "http://www.comsenz.com/downloads/install/uchome"

# Dorks #
dorks [
'"powered by UCenter Home"'
]

matches [

# Default title
{ :text=>'Powered by UCenter Home</title>' },

# Version detection # Powered by text
{ :version=>/Powered by <a  href="http:\/\/u.discuz.net" target="_blank"><strong>UCenter Home<\/strong><\/a> <span title="[0-9]{8}">([\d\.]+)<\/span>/ },

]

end

