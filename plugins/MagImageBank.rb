##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MagImageBank" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-01
version "0.1"
description "The MagImageBank is a easy to use and flexible web-based DAM (digital asset management) for managing images, videos and documents"
website "http://www.magimagebank.com/"

# Google results as at 2011-09-01 #
# 179 for "Powered by MagImageBank" +"info@magimagebank.com"

# Dorks #
dorks [
'"Powered by MagImageBank" "info@magimagebank.com"'
]



# Matches #
matches [

# div id="SiteBottom" class="fun"
{ :text=>'</div></div><div id="SiteBottom" class="fun"></div><div id=\'SiteFooter\'>' },

# StyleSheet
{ :regexp=>/<link href="\/imagebank\/stylesheets\/fancybox\.css\?[\d]+" media="screen" rel="Stylesheet" type="text\/css" \/>/ },

# Powered by text
{ :text=>'Powered by MagImageBank | <a href="http://magimagebank.com/">magimagebank.com</a> | <a href="mailto:info@magimagebank.com">info@magimagebank.com</a>' },

]

end

