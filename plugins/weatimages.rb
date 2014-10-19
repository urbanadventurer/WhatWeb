##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Weatimages" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "Weatimages is very easy to use program that allows you to organize powerful web-based photo albums on your website in a minimal time. To publish photo album you just need to put one file from Weatimages distributive to a separate website directory containing your photos or folders (which become sub-albums) with your photos."
website "http://nazarkin.name/projects/weatimages/"

# 289 results for "powered by Weatimages" @ 2010-08-28
# 129 results for "powered by Weatimages" intitle:Albums @ 2010-08-28


matches [

# CSS
{ :text=>'<div align="center" class="weatimages_toppest_navig" style="text-decoration:underline;">' },

# Meta generator
{ :text=>'<meta name="Generator" content="Weatimages"/>' },

# Powered by text
{ :text=>'Powered by <a href="http://nazarkin.name/projects/weatimages/">Weatimages</a>' },

]

end

