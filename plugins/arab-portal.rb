##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Arab-Portal"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-07-25
  # v0.2 # Updated version detection and regex. 
]
version "0.2"
description "Arab-Portal"

# Dorks #
dorks [
'"powered by Arab Portal" -exploit'
]

# 308 results for "powered by Arab Portal" -exploit @ 2010-07-25


matches [

# Meta copyright
{ :regexp=>/<META NAME="COPYRIGHT" CONTENT="Copyright[^\>]*by Arab[\s]*Portal"/ },

# Version detection # Meta Copyright
{ :version=>/<META content="[^>]*Powered by: Arab Portal v([\d\.]+), Copyright[^>]*" name="description">/ },

# Version detection # Powered by text
{ :version=>/<center><font size=2>Powered by: Arab[\s]*Portal v([\d\.]+)[\s]*, Copyright/ },

]

end

