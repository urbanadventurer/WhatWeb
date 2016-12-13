##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Reinvigorate" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-20
version "0.1"
description "Reinvigorate measures your influence on the web in real-time. Simple, real-time web analytics + heatmaps."
website "http://www.reinvigorate.net/"



# Matches #
matches [

# HTML Comment
{ :certainty=>10, :text=>"<!-- Reinvigorate -->" },

# JavaScript src
{ :text=>'<script type="text/javascript" src="http://include.reinvigorate.net/re_.js"></script>' },

# Extract Account # JavaScript
{ :certainty=>25, :string=>/reinvigorate\.track\("([a-z\d]{5}-[a-z\d]{10})"\);/ },
{ :certainty=>10, :string=>/re_\("([a-z\d]{5}-[a-z\d]{10})"\);/ },

]

end

