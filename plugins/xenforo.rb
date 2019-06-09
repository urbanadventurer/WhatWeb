##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "XenForo"
authors [
  "Mateusz Golewski",
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # v0.2 # 2016-08-19 # Added cookie. 
  "Andrew Horton", # v0.3 # Added website. Tidied up description. 
]
version "0.3"
description "Commercial community forum developed in PHP."
website "https://xenforo.com/"

matches [

{:name=>"HTML id element", :regex=>/<html[^>]+id="XenForo"/},

# Cookie
{ :search => "headers[set-cookie]", :regexp => /^xf_session/, :name=>"xf_session cookie" },

]

end
