##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Photo-Gallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-29
version "0.1"
description "Easily create your own photo album on the internet. With the easy installation you can have your gallery up and running within 5 minutes with unlimited albums and photos."
website "http://phpweby.com/software/gallery"

# Google results as at 2010-08-29 #
# 40 for "Powered by PHP Photo Gallery"

# Dorks #
dorks [
'"Powered by PHP Photo Gallery"'
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://phpweby.com/software/gallery">PHP Photo Gallery</a>' }, # &copy; 2009 <a href="http://phpweby.com">PHP Weby</a><br />

{ :text=>'Powered by <a href="http://phpweby.com">PHP Photo Gallery</a>' },

]

end

