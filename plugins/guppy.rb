##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-10 #
# Updated version detection
##
Plugin.define "GuppY" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.2"
description "An easy, free web portal, GuppY will allow you to generate very easily a complete and interactive web site. It requires no database."
website "http://www.freeguppy.org/?lng=en"

# Google results as at 2010-08-06 #
# 326 for "Powered by GuppY" "CeCILL Free License"

# Dorks #
dorks [
'"Powered by GuppY" "CeCILL Free License"'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="Generator" content="GuppY">' },

# Version Detection # Copyright Footer HTML
{ :version=>/<div class="foot"><span class='copyright'>&nbsp; <a class='copyright' href='http:\/\/www.freeguppy.org\/' title='GuppY site' target='_blank'> Site powered by GuppY v([\d\.]+) <\/a>/ },

# Version Detection # HTML Comment
{ :version=>/  <!--\[  GuppY v([\d\.]+) CeCILL Copyright \(C\) [\d]{4}\-[\d]{4} by Laurent Duveau \- http:\/\/www.freeguppy.org\/  \]-->/ },

]

end

