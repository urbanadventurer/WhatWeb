##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fluid-Dynamics-Search-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "FDSE is an easy-to-install search engine for local and remote sites. It returns fast, accurate results from a template-driven architecture. Freeware and shareware versions are available with Perl source."
website "http://www.xav.com/scripts/search/"

# Google results as at 2011-03-17 #
# 180 for "Powered by the Fluid Dynamics Search Engine"

# Dorks #
dorks [
'"Powered by the Fluid Dynamics Search Engine"'
]



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/Powered by the <a href="http:\/\/www.xav.com\/scripts\/search\/"[^>]*>Fluid Dynamics Search Engine<\/a> v([\d\.]+) &copy; 20[\d]{2}/ },

]

end


