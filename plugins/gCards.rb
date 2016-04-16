##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "gCards" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "gCards is a free PHP-based eCard system that is easy to setup and use. gCards simple Administration Console allows the administrator to upload images (JPEGs of GIFs), add eCard categories, and modify existing settings - Note: This project is dormant - no further updates will be done"
website "http://www.gregphoto.net/gcards/index.php"

# Google results as at 2011-03-15 #
# 359 for "powered by gcards"
# 11 for intitle:"eCards Administration Console Login" inurl:login.php

# Dorks #
dorks [
'"powered by gcards"',
'intitle:"eCards Administration Console Login" inurl:login.php'
]



# Matches #
matches [

# Compose Link
{ :certainty=>75, :text=>'<a href="compose.php?imageid=' },

# Admin Page # Default Title
{ :text=>"<title>eCards Administration Console Login</title>" },

# Version Detection
{ :version=>/<td>(Driftet av|Powered by|Un script de ) <a href="http:\/\/www.gregphoto.net\/gcards\/index.php"[^>]*>gCards<\/a> v([\d\.]+)<\/td>/, :offset=>1 },

]

end


