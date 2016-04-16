##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Jamroom" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.2"
description "Jamroom specializes in building web communities centered around media producers such as musicians, photographers, video enthusiasts and more - Jamroom gives you the capability to provide dozens of different services to your users."
website "http://www.jamroom.net/"

# Google results as at 2010-07-25 #
# 201 for "Powered by Jamroom"

# Dorks #
dorks [
'"Powered by Jamroom"'
]



# If you are a Licensed Jamroom User, you are free to remove ALL references to Jamroom or Jamroom.net from any of the OUTPUT templates (i.e. Artist Themes, Ranking templates, chart templates, etc.).

# Matches #
matches [

# Default search input tag
{ :text=>'<input type="text" name="search_string" class="jform s_input" style="width:300px;">' },

# Meta Designer
{ :text=>'<meta name="designer" content="Talldude Networks, LLC.">' },

# Powered by link HTML
{ :regexp=>/<a href="http:\/\/www.jamroom.net"><img src="[^"]*" alt="Powered by Jamroom - the Powerful Social Media Platform" title="Powered by Jamroom - the Powerful Social Media Platform" border="0"><\/a>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Jamroom ([\d\.]+)">/ },

]

end

