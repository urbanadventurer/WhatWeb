##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Netref"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-09-03
  # v0.2 # 2011-02-15 # Updated version detection. 
  "Andrew Horton", # v0.3 # 2016-04-17 # Added description. 
]
version "0.3"
description "Website used to be http://www.netref.net/"

# Google results as at 2011-02-15 #
# 197 for "powered by Netref"
# 29 for "Powered by Netref 5"

# Dorks #
dorks [
'"powered by Netref"'
]

# Matches #
matches [

# HTML Comment
{ :text=>'Annuaire Netref : http://www.netref.net' },

# Version Detection # Powered by text
{ :version=>/<a href=['|"]?http:\/\/www.netref.(fr|net)['|"]? class=['|"]?lienp['|"]?[^>]*>Powered by Netref ([\d\.]+) &copy; [0-9]{4}<\/a>/, :offset=>1 },

]

end

