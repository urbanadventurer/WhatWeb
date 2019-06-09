##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "HTML5"
authors [
  "Andrew Horton",
  # v0.2 # removed :probability. 
]
version "0.2"
description "HTML version 5, detected by the doctype declaration"




# Matches #
matches [

{ :regexp=>/<!DOCTYPE html>/i },
{ :string=>"applicationCache", :regexp=>/<html[^>]* manifest=/ },

]

end

