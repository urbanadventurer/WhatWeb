##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "JQuery"
authors [
  "Andrew Horton",
  # v0.2 # removed :probability. 
  # v0.3 # rewrite. 
  "Eric Sesterhenn", # v0.4 # added another match line
  "Janosch Maier @Phylu", # v0.5 # 2018-04-20 # added a version detection.
]
version "0.5"
description "A fast, concise, JavaScript that simplifies how to traverse HTML documents, handle events, perform animations, and add AJAX."
website "http://jquery.com/"

# Matches #
matches [

# JavaScript
{ :regexp=>/<script [^>]*jquery/ },

# JavaScript # Version Detection
{ :version=>/jquery(\.min)?\.js\?ver=([0-9\.]+)['"]/, :offset=>1 },
{ :version=>/jquery\/([0-9\.]+)\/jquery(\.min)?\.js/, :offset=>0 },
{ :version=>/jquery-([0-9\.]+)(\.min)?\.js/, :offset=>0 }

]

end

