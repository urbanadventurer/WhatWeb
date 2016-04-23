##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpGraphy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-06
version "0.1"
description "phpGraphy is a free PHP photo gallery script released under GPL license."
website "http://phpgraphy.sourceforge.net/"

# Google results as at 2011-05-06 #
# 397 for "This site is using phpGraphy" -intitle
# 389 for "This site is using phpGraphy" -intitle intitle:"my phpGraphy site"

# Dorks #
dorks [
'"This site is using phpGraphy" -intitle'
]



# Matches #
matches [

# Title
{ :text=>'<title>my phpGraphy site</title>' },

# Version Detection # Powered by footer
{ :version=>/This site is using <a href="http:\/\/phpgraphy\.sourceforge\.net\/">phpGraphy<\/a>\n([^\s]+) - Page generated in [\d\.]+s\.<\/div><!--\/\/footer-->/ },

]

end


