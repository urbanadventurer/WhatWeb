##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Google-API"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-09 
  # v0.2 # 2011-03-02 # Updated regex. Added dynamic match. 
]
version "0.2"
description "This plugin identifies references to Google API in <script>."



# Matches #
matches [

# Dynamic
{ :regexp=>/<script[^>]+src[\s]*=[\s]*["|']?http:\/\/www.google.com\/jsapi[^>]*>[\s]*<\/script[\s]*>/i, :string=>"Dynamic" },

# Extract source path
{ :string=>/<script[^>]+src[\s]*=[\s]*["|']?http:\/\/ajax.googleapis.com\/([a-zA-Z0-9\/\.-_]+)["|']?[^>]*>[\s]*<\/script[\s]*>/i },

]

end

