##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fossil" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-01
version "0.1"
description "Simple, high-reliability, distributed software configuration management"
website "http://fossil-scm.org/index.html/doc/trunk/www/index.wiki"

# Google results as at 2012-05-01 #
# 26 for "Fossil version " inurl:"fossil.cgi"

# Dorks #
dorks [
'"Fossil version " inurl:"fossil.cgi"'
]



# Matches #
matches [

# Version Detection # Footer
{ :version=>/<div class="footer">\s+(<a href="http:\/\/fossil-scm\.org">Fossil<\/a>|Fossil) version \[([^\]]+)\] [\d]{4}\-[\d]{2}\-[\d]{2} [\d]{2}:[\d]{2}:[\d]{2}/, :offset=>1 },

# Year Detection
{ :string=>/<div class="footer">\s+(<a href="http:\/\/fossil-scm\.org">Fossil<\/a>|Fossil) version \[[^\]]+\] ([\d]{4}\-[\d]{2}\-[\d]{2} [\d]{2}:[\d]{2}:[\d]{2})/, :offset=>1 },

]

end

