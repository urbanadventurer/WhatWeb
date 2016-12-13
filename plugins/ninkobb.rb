##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NinkoBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "NinkoBB"
website "http://ninkobb.com/"

# Google results as at 2011-02-27 #
# 55 for "Powered by NinkoBB"

# Dorks #
dorks [
'"Powered by NinkoBB"'
]



# Matches #
matches [

# Default Stylesheet
{ :regexp=>/<link href="[^"]*\/assets\/css\/ninko.css" rel="stylesheet" type="text\/css" \/>/ },

# Powered by text
{ :text=>'Powered by <a href="http://ninkobb.com">NinkoBB</a>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/ninkobb.com\/">NinkoBB<\/a> v. ([\d\.]{1,5}) t./ },

]

end


