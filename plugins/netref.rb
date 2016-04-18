##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-17 # Andrew Horton
# Added description
##
# Version 0.2 # 2011-02-15 #
# Updated version detection
##
Plugin.define "Netref" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
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

