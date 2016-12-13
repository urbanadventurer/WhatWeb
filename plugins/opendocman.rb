##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenDocMan" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "OpenDocMan - Open Source Document Management System - Requires PHP"
website "http://www.opendocman.com/"

# Google results as at 2012-08-26 #
# 29 for "OpenDocMan" "Stephen Lawrence" intitle:"Document Repository"

# Dorks #
dorks [
'"OpenDocMan" "Stephen Lawrence" intitle:"Document Repository"'
]



# Matches #
matches [

# Version Detection
{ :version=>/<a href="http:\/\/www\.opendocman\.com\/" target="_new">OpenDocMan v([^"^\s]+)<\/a>/ },

# Logo HTML
{ :text=>'<td align="left"><img src="images/logo.gif" alt="Site Logo" border=0></td>' },

# Welcome text
{ :regexp=>/<td valign="top">\s+Welcome to OpenDocMan\.?\s+<p>/ },

]

end

