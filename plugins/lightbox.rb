##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Lightbox"
authors [
  "Andrew Horton",
  # v0.2 # removed :probability & :name
]
version "0.2"
description "Javascript for nice image popups"

# identifying strings

matches [
{:regexp=>/<script [^>]*(lightbox[^>]*.js)[^>]*/},
]


end
