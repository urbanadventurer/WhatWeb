##
# Version 0.3 # 2016-08-19 # "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" 
# Added affiliate cookie
##
# Version 0.2 Andrew Horton
# Added website parameter
##
# 2014-11-04 # Napz
##

##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "3dcart"
authors [
  "Napz <napzs@rocketmail.com>", # 2014-11-04
  "Andrew Horton", # v0.2 # Added website parameter. 
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # v0.3 # 2016-08-19 # Added affiliate cookie. 
]
version "0.3"
description "3dcart - The 3dcart Shopping Cart Software is a complete ecommerce solution for anyone."
website "http://www.3dcart.com/"

# Dorks #
dorks [
'"powered by 3dcart"'
]

# Matches #
matches [

# HTML Comment
{ :text=>'<!--START: 3dcart stats-->' },

{ :text=>'<!--END: 3dcart stats-->' },

{ :search=>"headers[set-cookie]", :regexp=>/3dvisit/ },

{ :search => "headers[set-cookie]", :regexp => /^affiliate\s/, :name=>"affiliate cookie", :certainty => 25 },

]

end
