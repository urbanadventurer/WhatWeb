##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Script"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-14
  "Andrew Horton", # v0.2 # 2019-07-10 # Fix warning: character class has duplicated range
]
version "0.2"
description "This plugin detects instances of script HTML elements and returns the script language/type."

# Google results as at 2010-10-14 #
# 384 for "your browser does not support javascript"



# Matches #
matches [

# <script> tag
{ :regexp=>/<script(\s|>)/i },

# <script> tag # Detect type/language
{ :string=>/<script[^>]+(language|type)\s*=\s*['"]?([^'"\s]+)['"]?/, :offset=>1 },

]

end

