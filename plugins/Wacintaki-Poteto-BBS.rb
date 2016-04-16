##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Wacintaki-Poteto-BBS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-23
version "0.1"
description "Wacintaki Poteto BBS is a CSS conversion of Oekaki Poteto 5.x."
website "http://www.ninechime.com/products/"

# Oekaki is the Japanese term to describe the act of drawing, meaning "doodle or scribble". On the internet oekaki generally means "badly drawn furry porn"

# Google results as at 2011-08-23 #
# 379 for "Wacintaki * by Waccoon / Based on OekakiPoteto v5.x by RanmaGuy and Marcello"
#   4 for intitle:"OekakiPoteto Installation" "Wacintaki Poteto Installation"

# Dorks #
dorks [
'"Wacintaki * by Waccoon / Based on OekakiPoteto v5.x by RanmaGuy and Marcello"']



# Matches #
matches [

# Version Detection # Footer
{ :version=>/<a href="http:\/\/www\.NineChime\.com\/products\/" title="Get your own free BBS!">Wacintaki ([^\s^<]+)<\/a> by Waccoon/ },

# OekakiPoteto Footer
{ :regexp=>/<div align="center">OekakiPoteto v([^\s]+) by <a href="http:\/\/suteki\.nu">RanmaGuy<\/a> and <a href="http:\/\/www\.cellosoft\.com">Marcello<\/a>/ },

# Install Page
{ :text=>'OekakiPoteto 5.x by <a href="http://www.suteki.nu">RanmaGuy</a> and <a href="http://www.cellosoft.com">Marcello</a><br />' },

]

end

