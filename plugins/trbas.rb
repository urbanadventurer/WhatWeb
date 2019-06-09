##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Trbas"
authors [
  "Sigit Dewanto",
]
version "0.1"
description "Trbas is a news website engine for sites of Tribune Newspaper, used by mcall.com, chicagotribune.com and latimes.com"

matches [

{ :text=> '<link rel="stylesheet" href="http://www.trbas.com' }

]

end
