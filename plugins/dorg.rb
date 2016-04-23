##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DORG" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-22
version "0.1"
description "DORG is an Disc organization script which makes it easier for customers and businesses to find their software."
website "http://www.discorganizer.org/"

# 1 for "Powered by DORG"

# Dorks #
dorks [
'"Powered by DORG"'
]



# Matches #
matches [

# Powered by link
{ :text=>'<p>Powered by <a href="http://www.discorganizer.org">DORG</a>' },

# Titles
{ :text=>'<title>DORG - Disc Organization System</title>' },
{ :text=>'<title>DORG - admin panel</title>' },

# Meta Description
{ :text=>'<meta name="description" content="this is the administration panel of the DORG system" />' },

]

end


